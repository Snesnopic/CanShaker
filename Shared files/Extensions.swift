//
//  DateExtension.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 23/02/24.
//

import Foundation
import CoreMotion
import SwiftUI
import HealthKit

extension Color {
    static func random() -> Color {
        return Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
}

extension View {
    @ViewBuilder func `if`<T>(_ condition: Bool, transform: (Self) -> T) -> some View where T: View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

extension Date:RawRepresentable{
    public typealias RawValue = String
    public init?(rawValue: RawValue) {
        guard let data = rawValue.data(using: .utf8),
              let date = try? JSONDecoder().decode(Date.self, from: data) else {
            return nil
        }
        self = date
    }
    
    public var rawValue: RawValue{
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data:data,encoding: .utf8) else {
            return ""
        }
        return result
    }
}

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else { return nil }
        self = result
    }
    
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}

extension CMAcceleration: Codable {
    enum CodingKeys: CodingKey {
        case x, y, z
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(x, forKey: .x)
        try container.encode(y, forKey: .y)
        try container.encode(z, forKey: .z)
    }
    
    public init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        x = try container.decode(CGFloat.self, forKey: .x)
        y = try container.decode(CGFloat.self, forKey: .y)
        z = try container.decode(CGFloat.self, forKey: .z)
    }
    
    func getTotalAcceleration() -> Double {
        var totalAccel:Double = 0.0
        totalAccel = sqrt(self.x * self.x + self.y * self.y + self.z * self.z)
        return totalAccel
    }
    
}

extension HKQuantityType {
    func getAssociatedUnit() -> HKUnit {
        if self.description == "HKQuantityTypeIdentifierHeartRate" {
            return HKUnit.init(from: "count/s")
        }
        else {
            return HKUnit.smallCalorie()
        }
    }
}

extension Date {
    func isTheSame(_ component: Calendar.Component, as date: Date) -> Bool {
        return Calendar.current.compare(self, to: date, toGranularity: component) == .orderedSame
    }
}
