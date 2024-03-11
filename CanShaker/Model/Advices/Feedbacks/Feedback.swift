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
    var associatedSession: Session? = nil
    
    init(sentence: String, type: feedbackType, category: feedbackCategory, condition: condition, imageName: String) {
        self.sentence = sentence
        self.type = type
        self.category = category
        self.condition = condition
        self.imageName = imageName
    }
    private init(_ feedBack:Feedback) {
        self.sentence = feedBack.sentence
        self.type = feedBack.type
        self.category = feedBack.category
        self.condition = feedBack.condition
        self.imageName = feedBack.imageName
    }
    init(session: Session) {
        let duration = session.duration
        let calories = Int(session.calories)
        let heartRate = session.getAverage(dataset: session.heartRateData.values)
        let accel = session.getAverage(dataset: session.accelData.values)
        var feedbackToCreate:Feedback?
        if duration > 180.0 {
            if calories > 90 {
                if heartRate > 120 {
                    if accel > 3.5 {
                        feedbackToCreate = Feedback.filterFeedback(byType: .compliment, byCategory: .heartBeat, byCondition: .high)
                    } else if accel <= 2.5 {
                        feedbackToCreate = Feedback.filterFeedback(byType: .insult, byCategory: .heartBeat, byCondition: .low)
                    }
                } else if heartRate <= 110 {
                    feedbackToCreate = Feedback.filterFeedback(byType: .insult, byCategory: .heartBeat, byCondition: .low)
                }
            } else if calories <= 80 {
                feedbackToCreate = Feedback.filterFeedback(byType: .insult, byCategory: .calories, byCondition: .low)
            }
        } else if duration <= 60.0 {
            feedbackToCreate = Feedback.filterFeedback(byType: .insult, byCategory: .speed, byCondition: .high)
        }
        else {
            feedbackToCreate = Feedback.filterFeedback(byType: .neutral, byCategory: .random, byCondition: .random)
        }
        self.sentence = feedbackToCreate!.sentence
        self.type = feedbackToCreate!.type
        self.category = feedbackToCreate!.category
        self.condition = feedbackToCreate!.condition
        self.imageName = feedbackToCreate!.imageName
        self.associatedSession = session
    }
    
    static func filterFeedback(byType type: feedbackType, byCategory category: feedbackCategory, byCondition condition: condition) -> Feedback {
        let filteredSentences = Feedback.list.filter { feedback in
            return feedback.type == type && feedback.category == category && feedback.condition == condition
        }
        return filteredSentences.randomElement()!
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
    
    
}
