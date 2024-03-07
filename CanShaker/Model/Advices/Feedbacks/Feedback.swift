//
//  Feedback.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 23/02/24.
//

import Foundation
import SwiftUI

class Feedback: Identifiable {
    let id: UUID = UUID()
    let sentence: String
    let type: feedbackType
    let category: feedbackCategory
    let condition: condition
    let imageName: String
    
    init(sentence: String, type: feedbackType, category: feedbackCategory, condition: condition, imageName: String) {
        self.sentence = sentence
        self.type = type
        self.category = category
        self.condition = condition
        self.imageName = imageName
    }
    
    func filterFeedback(byType type: feedbackType, byCategory category: feedbackCategory, byCondition condition: condition) -> Feedback? {
        let filteredSentences = Feedback.list.filter { feedback in
            return feedback.type == type && feedback.category == category && feedback.condition == condition
        }
        return filteredSentences.randomElement()
    }
    
    #warning("ALERT: shit code flooded the floor")
    func feedbackToShaker(sessions: [Session]) -> Feedback {
        
        guard !sessions.isEmpty else {
            //MARK: User downloaded the app for first time
            return Feedback(sentence: String(localized: "Hey there newcomer, start a session from the watch app to gain data!"), type: .compliment, category: .speed, condition: .low, imageName: "face.smiling.inverse")
        }
        
        guard let lastSession = sessions.last else {
            return filterFeedback(byType: .neutral, byCategory: .random, byCondition: .random)!
        }
        
        let duration = lastSession.duration
        let calories = Int(lastSession.calories)
        let heartRate = sessions.last?.getAverage(dataset: lastSession.heartRateData.values)
        let accel = sessions.last?.getAverage(dataset: lastSession.accelData.values)
        
        if duration > 180.0 {
            if calories > 90 {
                if heartRate! > 120 {
                    if accel! > 3.5 {
                        return filterFeedback(byType: .compliment, byCategory: .heartBeat, byCondition: .high)!
                    } else if accel! <= 2.5 {
                        return filterFeedback(byType: .insult, byCategory: .heartBeat, byCondition: .low)!
                    }
                } else if heartRate! <= 110 {
                    return filterFeedback(byType: .insult, byCategory: .heartBeat, byCondition: .low)!
                }
            } else if calories <= 80 {
                return filterFeedback(byType: .insult, byCategory: .calories, byCondition: .low)!
            }
        } else if duration <= 60.0 {
            return filterFeedback(byType: .insult, byCategory: .speed, byCondition: .high)!
        }
        return filterFeedback(byType: .neutral, byCategory: .random, byCondition: .random)!
    }
}


enum feedbackType {
    case insult
    case compliment
    case neutral
}

enum feedbackCategory {
    case speed
    case heartBeat
    case calories
    case accel
    case random
}

enum condition {
    case low
    case high
    case random
}


