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
    var accelData: [TimeInterval:CMAcceleration] = [:]
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
        print("Types to share: \(typesToShare)")
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
        
    }
    func startQueuedUpdates() {
        print("Prima di startDeviceMotionUpdates")
        session = Session()
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
                let currentUpdateTimeStamp = self.motion.deviceMotionUpdateInterval * Double(self.accelData.count)
                self.accelData[currentUpdateTimeStamp] = motion!.userAcceleration
                print("The array of movements now has \(self.accelData.count) elements")
            }
            if error != nil {
                print("ERROR: \(error!.localizedDescription)")
            }
        })
        
    }
    
    func stopQueuedUpdates() {
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
                workout!.allStatistics.forEach { (key: HKQuantityType, value: HKStatistics) in
                    print("Key: \(key.description)")
                    if let quantity = value.maximumQuantity() {
                           let unit = key.getAssociatedUnit()
                           let valueInUnit = quantity.doubleValue(for: unit)
                           print("Type: \(key.identifier), Value: \(valueInUnit) \(unit)")
                       }
//                    if let quantity = value.
                }
                
            })
        })
        if motion.isDeviceMotionActive {
            print("Motion updates are happening. Stopping...")
            motion.stopDeviceMotionUpdates()
            
            accelData.forEach { (key: TimeInterval, value: CMAcceleration) in
                var newValue:CMAcceleration = value
                newValue.x = abs(newValue.x)
                newValue.y = abs(newValue.y)
                newValue.z = abs(newValue.z)
                accelData[key] = newValue
            }
            accelData.forEach { (key: TimeInterval, value: CMAcceleration) in
                session!.accelData[key] = value.getTotalAcceleration()
            }
            session!.duration = abs((session!.date.timeIntervalSinceNow))
            print("Session duration: \(session!.duration)")
        }
        else {
            print("Motion updates are NOT happening!")
        }
    }
    
}
