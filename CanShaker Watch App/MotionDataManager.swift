//
//  MotionDataManager.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 22/02/24.
//

import Foundation
import CoreMotion

class MotionDataManager: ObservableObject {
    static var shared = MotionDataManager()
    let motion = CMMotionManager()
    let queue = OperationQueue()
    var accelData: [TimeInterval:CMAcceleration] = [:]
    private init() {
        motion.deviceMotionUpdateInterval = 1.0 / 5.0
        motion.showsDeviceMovementDisplay = true
    }
    func startQueuedUpdates() {
        print("Prima di startDeviceMotionUpdates")

        motion.startDeviceMotionUpdates(to: queue, withHandler: {
            motion, error in
            print("Qua ci arrivo?")
            if motion != nil {
                let currentUpdateTimeStamp = self.motion.deviceMotionUpdateInterval * Double(self.accelData.count)
                self.accelData[currentUpdateTimeStamp] = motion!.userAcceleration
                print("I have appended \(motion!.userAcceleration), now the array has \(self.accelData.count) elements")
            }
            if error != nil {
                print("ERROR: \(error!.localizedDescription)")
            }
        })
        
    }
    
    func stopQueuedUpdates() {
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
        }
        else {
            print("Motion updates are NOT happening!")
        }
    }
    
}
