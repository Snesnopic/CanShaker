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
        
        //MARK: Testing the real life possible values for condition is heavily required. Plus I think we have to reconsider the "compliment" or "insult" given that for how we created them, they go together with the condition. This means we should reconsider having to approach it with a compliment or an insult independently from the condition. The perfect idea would be having the feedback regarding the performance (with the condition being high or low) and select one random sentence without filtering it for compliments or insults in my honest opinion
        
        switch (duration, calories, heartRate, accel) {
            case let (d, c, hr, a) where (d > 180.0 && c > 70 && hr > 100 && a > 3.5):
                feedbackToCreate = Feedback.filterFeedback(byType: .compliment, byCategory: .accel, byCondition: .high)
            case let (d, c, hr, a) where (d > 180.0 && c > 70 && hr > 100 && a <= 2):
                feedbackToCreate = Feedback.filterFeedback(byType: .insult, byCategory: .accel, byCondition: .low)
            case let (d, c, hr, _) where (d > 180.0 && c > 70 && hr > 100):
                feedbackToCreate = Feedback.filterFeedback(byType: .compliment, byCategory: .heartBeat, byCondition: .high)
            case let (d, c, hr, _) where (d > 180.0 && c > 70 && hr <= 80):
                feedbackToCreate = Feedback.filterFeedback(byType: .insult, byCategory: .heartBeat, byCondition: .low)
            case let (d, c, _, _) where (d > 180.0 && c > 50):
                feedbackToCreate = Feedback.filterFeedback(byType: .compliment, byCategory: .calories, byCondition: .high)
            case let (d, c, _, _) where (d > 180.0 && c <= 20):
                feedbackToCreate = Feedback.filterFeedback(byType: .insult, byCategory: .calories, byCondition: .low)
            case let (d, _, _, _) where (d > 180.0):
                feedbackToCreate = Feedback.filterFeedback(byType: .compliment, byCategory: .duration, byCondition: .high)
            case let (d, _, _, _) where (d <= 60.0):
                feedbackToCreate = Feedback.filterFeedback(byType: .insult, byCategory: .duration, byCondition: .low)
            default:
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
        case duration
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
