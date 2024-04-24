//
//  Feedback.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 23/02/24.
//

import Foundation
import SwiftUI
import SwiftData

struct Feedback: Codable {
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
    private init(_ feedBack:Feedback) {
        self.sentence = feedBack.sentence
        self.type = feedBack.type
        self.category = feedBack.category
        self.condition = feedBack.condition
        self.imageName = feedBack.imageName
    }
    init(accelData: [TimeInterval : Double], duration: TimeInterval, heartRateData: [TimeInterval : Double], calories: Double) {
        let heartRate = heartRateData.getAverage()
        let accel = accelData.getAverage()
        var feedbackToCreate:Feedback?
        
        //MARK: Testing the real life possible values for condition is heavily required. Plus I think we have to reconsider the "compliment" or "insult" given that for how we created them, they go together with the condition. This means we should reconsider having to approach it with a compliment or an insult independently from the condition. The perfect idea would be having the feedback regarding the performance (with the condition being high or low) and select one random sentence without filtering it for compliments or insults in my honest opinion
        
        switch (duration, calories, heartRate, accel) {
            case let (d, c, hr, _) where (d == 69.0 || c == 69 || hr == 69):
                feedbackToCreate = Feedback.filterFeedback(byCategory: .easterEgg, byCondition: .random)
            case let (d, c, hr, a) where (d > 180.0 && c > 70 && hr > 100 && a > 3.5):
                feedbackToCreate = Feedback.filterFeedback(byCategory: .accel, byCondition: .high)
            case let (d, c, hr, a) where (d > 180.0 && c > 70 && hr > 100 && a <= 2):
                feedbackToCreate = Feedback.filterFeedback(byCategory: .accel, byCondition: .low)
            case let (d, c, hr, _) where (d > 180.0 && c > 70 && hr > 100):
                feedbackToCreate = Feedback.filterFeedback(byCategory: .heartBeat, byCondition: .high)
            case let (d, c, hr, _) where (d > 180.0 && c > 70 && hr <= 80):
                feedbackToCreate = Feedback.filterFeedback(byCategory: .heartBeat, byCondition: .low)
            case let (d, c, _, _) where (d > 180.0 && c > 70):
                feedbackToCreate = Feedback.filterFeedback(byCategory: .calories, byCondition: .high)
            case let (d, c, _, _) where (d > 180.0 && c <= 30):
                feedbackToCreate = Feedback.filterFeedback(byCategory: .calories, byCondition: .low)
            case let (d, _, _, _) where (d > 180.0):
                feedbackToCreate = Feedback.filterFeedback(byCategory: .duration, byCondition: .high)
            case let (d, _, _, _) where (d <= 60.0):
                feedbackToCreate = Feedback.filterFeedback(byCategory: .duration, byCondition: .low)
            
            default:
                feedbackToCreate = Feedback.filterFeedback(byCategory: .random, byCondition: .random)
            }
        
        self.sentence = feedbackToCreate!.sentence
        self.type = feedbackToCreate!.type
        self.category = feedbackToCreate!.category
        self.condition = feedbackToCreate!.condition
        self.imageName = feedbackToCreate!.imageName
    }
    init(session: Session) {
        let duration = session.duration
        let calories = Int(session.calories)
        let heartRate = session.heartRateData.getAverage()
        let accel = session.accelData.getAverage()
        var feedbackToCreate:Feedback?
        
        //MARK: Testing the real life possible values for condition is heavily required. Plus I think we have to reconsider the "compliment" or "insult" given that for how we created them, they go together with the condition. This means we should reconsider having to approach it with a compliment or an insult independently from the condition. The perfect idea would be having the feedback regarding the performance (with the condition being high or low) and select one random sentence without filtering it for compliments or insults in my honest opinion
        
        switch (duration, calories, heartRate, accel) {
            case let (d, c, hr, _) where (d == 69.0 || c == 69 || hr == 69):
                feedbackToCreate = Feedback.filterFeedback(byCategory: .easterEgg, byCondition: .random)
            case let (d, c, hr, a) where (d > 180.0 && c > 70 && hr > 100 && a > 3.5):
                feedbackToCreate = Feedback.filterFeedback(byCategory: .accel, byCondition: .high)
            case let (d, c, hr, a) where (d > 180.0 && c > 70 && hr > 100 && a <= 2):
                feedbackToCreate = Feedback.filterFeedback(byCategory: .accel, byCondition: .low)
            case let (d, c, hr, _) where (d > 180.0 && c > 70 && hr > 100):
                feedbackToCreate = Feedback.filterFeedback(byCategory: .heartBeat, byCondition: .high)
            case let (d, c, hr, _) where (d > 180.0 && c > 70 && hr <= 80):
                feedbackToCreate = Feedback.filterFeedback(byCategory: .heartBeat, byCondition: .low)
            case let (d, c, _, _) where (d > 180.0 && c > 70):
                feedbackToCreate = Feedback.filterFeedback(byCategory: .calories, byCondition: .high)
            case let (d, c, _, _) where (d > 180.0 && c <= 30):
                feedbackToCreate = Feedback.filterFeedback(byCategory: .calories, byCondition: .low)
            case let (d, _, _, _) where (d > 180.0):
                feedbackToCreate = Feedback.filterFeedback(byCategory: .duration, byCondition: .high)
            case let (d, _, _, _) where (d <= 60.0):
                feedbackToCreate = Feedback.filterFeedback(byCategory: .duration, byCondition: .low)
            
            default:
                feedbackToCreate = Feedback.filterFeedback(byCategory: .random, byCondition: .random)
            }
        
        self.sentence = feedbackToCreate!.sentence
        self.type = feedbackToCreate!.type
        self.category = feedbackToCreate!.category
        self.condition = feedbackToCreate!.condition
        self.imageName = feedbackToCreate!.imageName
    }
    
    static func filterFeedback(byCategory category: feedbackCategory, byCondition condition: condition) -> Feedback {
        let filteredSentences = Feedback.list.filter { feedback in
            return feedback.category == category && feedback.condition == condition
        }
        return filteredSentences.randomElement()!
    }
    
    
    enum feedbackType: Codable {
        case insult
        case compliment
        case neutral
    }
    
    enum feedbackCategory: Codable {
        case duration
        case heartBeat
        case calories
        case accel
        case random
        case easterEgg
    }
    
    enum condition: Codable {
        case low
        case high
        case random
    }
    
    
}
