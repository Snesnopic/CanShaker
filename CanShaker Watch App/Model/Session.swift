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
        case date, accelData, duration
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(date, forKey: .date)
        try container.encode(accelData, forKey: .accelData)
        try container.encode(duration, forKey: .duration)
    }
    
    required public convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        date = try container.decode(Date.self, forKey: .date)
        accelData = try container.decode([TimeInterval:Double].self, forKey: .accelData)
        duration = try container.decode(TimeInterval.self, forKey: .duration)
    }
    var date: Date
    var accelData: [TimeInterval:Double]
    var duration: TimeInterval
    init(date: Date = Date(), accelData: [TimeInterval : Double] = [:], duration: TimeInterval = 0.0) {
        self.date = date
        self.accelData = accelData
        self.duration = duration
    }
}
