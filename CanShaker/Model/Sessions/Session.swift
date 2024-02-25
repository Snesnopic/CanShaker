//
//  Session.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 25/02/24.
//

import Foundation

class Bpm: Identifiable {
    let id: UUID = UUID()
    let time: Double
    let heartRate: Double
    
    init(time: Double, heartRate: Double) {
        self.time = time
        self.heartRate = heartRate
    }
}
class Session: Identifiable {
    let id: UUID = UUID()
    let averageSpeed: Double
    let averageBPM: Double
    let calories: Double
    let bpmData: [Bpm]
    let speedData: [(Double, Double)]
    let time: Double
    let date: Date
    
    init(averageSpeed: Double, averageBPM: Double, calories: Double, bpmData: [Bpm], speedData: [(Double, Double)], time: Double, date: Date) {
        self.averageSpeed = averageSpeed
        self.averageBPM = averageBPM
        self.calories = calories
        self.bpmData = bpmData
        self.speedData = speedData
        self.time = time
        self.date = date
    }
}


//TODO: to delete after implementing SwiftData
extension Session {
    static let list = [
        Session(averageSpeed: 13, averageBPM: 90, calories: 999, bpmData: [Bpm(time: 0, heartRate: 65), Bpm(time: 0.5, heartRate: 75), Bpm(time: 1, heartRate: 95), Bpm(time: 1.5, heartRate: 100), Bpm(time: 2, heartRate: 90), Bpm(time: 2.5, heartRate: 75), Bpm(time: 3, heartRate: 85)],
                speedData: [(12, 0), (10, 0.5), (12, 1), (12, 1.5), (11, 2), (10, 2.5), (6, 3), (4, 3.5)], time: 3, date: .now)
    ]
}
