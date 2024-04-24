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
class Session: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case uuid, date, accelData, duration, heartRateData, calories, associatedFeedback
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(uuid, forKey: .uuid)
        try container.encode(date, forKey: .date)
        try container.encode(accelData, forKey: .accelData)
        try container.encode(duration, forKey: .duration)
        try container.encode(heartRateData, forKey: .heartRateData)
        try container.encode(calories, forKey: .calories)
        try container.encode(associatedFeedback, forKey: .associatedFeedback)
    }
    
    required public convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        uuid = try container.decode(UUID.self, forKey: .uuid)
        date = try container.decode(Date.self, forKey: .date)
        accelData = try container.decode([TimeInterval:Double].self, forKey: .accelData)
        duration = try container.decode(TimeInterval.self, forKey: .duration)
        heartRateData = try container.decode([TimeInterval:Double].self, forKey: .heartRateData)
        calories = try container.decode(Double.self, forKey: .calories)
        associatedFeedback = try container.decode(Feedback.self, forKey: .associatedFeedback)
    }
    @Attribute(.unique) var uuid: UUID = UUID()
    var date: Date
    var accelData: [TimeInterval:Double]
    var duration: TimeInterval
    var heartRateData: [TimeInterval:Double]
    var calories: Double
    var associatedFeedback: Feedback
    init(date: Date = Date(), accelData: [TimeInterval : Double] = [:], duration: TimeInterval = 0.0, heartRateData: [TimeInterval : Double] = [:], calories: Double = 0.0) {
        self.date = date
        self.accelData = accelData
        self.duration = duration
        self.heartRateData = heartRateData
        self.calories = calories
        self.associatedFeedback = Feedback(accelData: accelData, duration: duration, heartRateData: heartRateData, calories: calories)
    }
}
