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
class Session: Codable {
    enum CodingKeys: CodingKey {
        case date, accelData, duration, heartRateData, calories
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(date, forKey: .date)
        try container.encode(accelData, forKey: .accelData)
        try container.encode(duration, forKey: .duration)
        try container.encode(heartRateData, forKey: .heartRateData)
        try container.encode(calories, forKey: .calories)
    }
    
    required public convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        date = try container.decode(Date.self, forKey: .date)
        accelData = try container.decode([TimeInterval:Double].self, forKey: .accelData)
        duration = try container.decode(TimeInterval.self, forKey: .duration)
        heartRateData = try container.decode([TimeInterval:Double].self, forKey: .heartRateData)
        calories = try container.decode(Double.self, forKey: .calories)
    }
    var date: Date
    var accelData: [TimeInterval:Double]
    var duration: TimeInterval
    var heartRateData: [TimeInterval:Double]
    var calories: Double
    init(date: Date = Date(), accelData: [TimeInterval : Double] = [:], duration: TimeInterval = 0.0, heartRateData: [TimeInterval : Double] = [:], calories: Double = 0.0) {
        self.date = date
        self.accelData = accelData
        self.duration = duration
        self.heartRateData = heartRateData
        self.calories = calories
    }
}
