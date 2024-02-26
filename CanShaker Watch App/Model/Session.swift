//
//  Session.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 23/02/24.
//

import Foundation
import CoreMotion
import SwiftData

@Model 
class Session{
    var date: Date
    var accelData: [TimeInterval:CMAcceleration]
    var duration: TimeInterval
    init(date: Date = Date(), accelData: [TimeInterval : CMAcceleration] = [:], duration: TimeInterval = 0.0) {
        self.date = date
        self.accelData = accelData
        self.duration = duration
    }
    
}

