//
//  Feedback.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 23/02/24.
//

import Foundation

class Feedback: Identifiable {
    let id: UUID = UUID()
    let sentence: String
    let type: feedbackType
    let category: feedbackCategory
    let condition: condition
    
    init(sentence: String, type: feedbackType, category: feedbackCategory, condition: condition) {
        self.sentence = sentence
        self.type = type
        self.category = category
        self.condition = condition
 
    }
     
    func filterFeedback(byType type: feedbackType, byCategory category: feedbackCategory, byCondition condition: condition) -> String? {
        let filteredSentences = Feedback.list.filter { feedback in
            return feedback.type == type && feedback.category == category && feedback.condition == condition
        }
        return filteredSentences.randomElement()?.sentence
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


