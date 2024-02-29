//
//  MotionDataManager.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 22/02/24.
//

import Foundation
import CoreMotion
import SwiftData
import HealthKit

class MotionDataManager: ObservableObject {
    static var shared = MotionDataManager()
    let motion = CMMotionManager()
    let queue = OperationQueue()
    var session:Session? = nil
    let healthStore:HKHealthStore
    var workoutSession: HKWorkoutSession?
    var workoutBuilder: HKLiveWorkoutBuilder?
    private init() {
        motion.deviceMotionUpdateInterval = 1.0 / 5.0
        motion.showsDeviceMovementDisplay = true
        
        //HealthKit part
        healthStore = HKHealthStore()
        let typesToShare:Set = [HKQuantityType.workoutType()]
        let typesToRead:Set = [HKQuantityType.quantityType(forIdentifier: .heartRate)!,.quantityType(forIdentifier: .activeEnergyBurned)!]
        healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead) {(success,error) in
            guard success else {
                print("Errore alla richiesta di autorizzazioni: \(error!.localizedDescription)")
                return
            }
        }
    }
    func startQueuedUpdates() {
        print("Prima di startDeviceMotionUpdates")
        session = Session()
        
        let typesToShare:Set = [HKQuantityType.workoutType()]
        let typesToRead:Set = [HKQuantityType.quantityType(forIdentifier: .heartRate)!,.quantityType(forIdentifier: .activeEnergyBurned)!]
        healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead) {(success,error) in
            guard success else {
                print("Errore alla richiesta di autorizzazioni: \(error!.localizedDescription)")
                return
            }
        }
        let configuration = HKWorkoutConfiguration()
        configuration.activityType = .handCycling
        configuration.locationType = .indoor
        do {
            workoutSession = try HKWorkoutSession(healthStore: healthStore, configuration: configuration)
            workoutBuilder = workoutSession!.associatedWorkoutBuilder()
            workoutBuilder!.dataSource = HKLiveWorkoutDataSource(healthStore: healthStore, workoutConfiguration: configuration)
        }
        catch {
            print("Errore nella costruzione del workout: \(error)")
            return
        }
        
        workoutSession!.startActivity(with: Date())
        workoutBuilder!.beginCollection(withStart: Date(), completion: { (success,error) in
            guard success else {
                print("Errore prima di iniziare a prendere dati: \(error!.localizedDescription)")
                return
            }
        })
        motion.startDeviceMotionUpdates(to: queue, withHandler: {
            motion, error in
            if motion != nil {
                let currentUpdateTimeStamp = self.motion.deviceMotionUpdateInterval * Double(self.session!.accelData.count)
                print("Current updatetimestamp: \(currentUpdateTimeStamp)")
                self.session!.accelData[currentUpdateTimeStamp] = motion!.userAcceleration.getTotalAcceleration()
                print("The array of movements now has \(self.session!.accelData.count) elements")
            }
            if error != nil {
                print("ERROR: \(error!.localizedDescription)")
            }
        })
        
    }
    
    func stopQueuedUpdates() {
        var doneWithHealth:Bool = false
        workoutSession!.end()
        workoutBuilder!.endCollection(withEnd: Date(), completion: { (success, error) in
            guard success else {
                print("Errore al termine del workoutBuilder: \(error!.localizedDescription)")
                return
            }
            self.workoutBuilder?.finishWorkout(completion: { (workout,error) in
                guard workout != nil else {
                    print("Errore prima di finire il workout: \(error!.localizedDescription)")
                    return
                }
                print("Statistics count: \(workout!.allStatistics.count)")
                let calories = workout!.totalEnergyBurned
                print("Calories: \(calories!.doubleValue(for: HKUnit.kilocalorie()))")
                self.session!.calories = calories!.doubleValue(for: HKUnit.kilocalorie())
                
                let heartRateType = HKObjectType.quantityType(forIdentifier: .heartRate)!
                let predicate = HKQuery.predicateForSamples(withStart: workout!.startDate, end: workout!.endDate, options: .strictStartDate)
                let query = HKSampleQuery(sampleType: heartRateType, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: .none) { (query, results, error) in
                    guard let samples = results as? [HKQuantitySample], error == nil else {
                        print("Error: \(error!.localizedDescription)")
                        return
                    }
                    for sample in samples {
                        let heartRateUnit = HKUnit.count().unitDivided(by: HKUnit.minute())
                        let value = sample.quantity.doubleValue(for: heartRateUnit)
                        let date = sample.startDate
                        let dateAsTimeInterval = date.timeIntervalSince(self.workoutSession!.startDate!)
                        self.session!.heartRateData[dateAsTimeInterval] = value
                    }
                    print("I'm done with health data")
                    doneWithHealth = true
                }
                self.healthStore.execute(query)
            })
        })
        if motion.isDeviceMotionActive {
            print("Motion updates are happening. Stopping...")
            motion.stopDeviceMotionUpdates()
            session!.duration = abs(session!.date.distance(to: Date()))
            var clampedData: [TimeInterval: Double] = [:]
            let keys = Array(session!.accelData.keys.sorted())
            for i in stride(from: 0, to: keys.count, by: 5) {
                let endIndex = min(i + 5, keys.count)
                let slice = keys[i..<endIndex]
                
                var sum:Double = 0.0
                for key in slice {
                    if let value = session!.accelData[key] {
                        sum += value
                    }
                }
                clampedData[slice.min()!] = (sum/Double(slice.count))
            }
            session!.accelData = clampedData
            print("Session duration: \(session!.duration)")
            while doneWithHealth == false {
                
            }
        }
        else {
            print("Motion updates are NOT happening!")
        }
    }
    
}
