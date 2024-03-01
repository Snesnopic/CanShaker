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
}


enum feedbackType {
    case insult
    case compliment
}

enum feedbackCategory {
    case speed
    case heartBeat
    case calories
}

enum condition {
    case low
    case high
}
