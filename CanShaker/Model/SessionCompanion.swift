//
//  Session.swift
//  CanShaker
//
//  Created by Davide Castaldi on 23/02/24.
//

import Foundation
import CoreMotion
import HealthKit

struct SessionCompanion: Identifiable {
    var id = UUID()
    var time: TimeInterval
    var speed: Double
    var bpm: HKHealthStore
    var calories: HKHealthStore
    var acceleration: [TimeInterval:CMAcceleration]
}
