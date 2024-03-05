//
//  FeedbackList.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 25/02/24.
//

import Foundation

extension Feedback {
    static let list = [
        Feedback(sentence: "It looks like we have a marathon runner here!", type: .compliment, category: .speed, condition: .low),
        Feedback(sentence: "You were so fast that Flash had to change job!", type: .insult, category: .speed, condition: .high),
        
        Feedback(sentence: "Your post-workout heartbeat is so chill, even a meditation guru would envy your cardio-nap routine!", type: .insult, category: .heartBeat, condition: .low),
        Feedback(sentence: "Wow, your heartbeat is so fast, I bet even Usain Bolt would struggle to keep up with it in a sprint!", type: .compliment, category: .heartBeat, condition: .high),
        
        Feedback(sentence: "You burned fewer calories than a sloth doing slow-motion yoga", type: .insult, category: .calories, condition: .low),
        Feedback(sentence: "Someone wanted to burn calories in an unorthodox way...", type: .compliment, category: .calories, condition: .high)
        
    ]
}
