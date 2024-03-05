//
//  FeedbackList.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 25/02/24.
//

import Foundation

extension Feedback {
    static let list = [
        
        //MARK: SPEED
        Feedback(sentence: String(localized: "It looks like we have a marathon runner here!"), type: .compliment, category: .speed, condition: .low),
        Feedback(sentence: String(localized: "You were so fast that Flash had to change job!"), type: .insult, category: .speed, condition: .high),
        
        
        //MARK: HEARTBEAT
        Feedback(sentence: String(localized: "Your post-workout heartbeat is so chill, even a meditation guru would envy your cardio-nap routine!"), type: .insult, category: .heartBeat, condition: .low),
        Feedback(sentence: String(localized: "Wow, your heartbeat is so fast, I bet even Usain Bolt would struggle to keep up with it in a sprint!"), type: .compliment, category: .heartBeat, condition: .high),
        
        
        //MARK: CALORIES
        Feedback(sentence: String(localized: "You burned fewer calories than a sloth doing slow-motion yoga"), type: .insult, category: .calories, condition: .low),
        Feedback(sentence: String(localized: "Someone wanted to burn calories in an unorthodox way..."), type: .compliment, category: .calories, condition: .high)
        
        //MARK: ACCEL
        Feedback(sentence: "Slow and steady wins the race.", type: .insult, category: .accel, condition: .low),
        Feedback(sentence: "Are you shaking it like your life depends on it?!", type: .compliment, category: .accel, condition: .high),
        
        //MARK: RANDOM
        Feedback(sentence: "Ascanio?!", type: .neutral, category: .random, condition: .random),
        Feedback(sentence: "There are clouds above your head, everybody knows your deed.", type: .neutral, category: .random, condition: .random)
    ]
}
    
    
//    Feedback(sentence: "It looks like we have a marathon runner here!", type: .compliment, category: .speed, condition: .low),
//    Feedback(sentence: "You were so fast that Flash had to change job!", type: .insult, category: .speed, condition: .high),
//    
//    
//    Feedback(sentence: "Were you actually shakng it?", type: .insult, category: .heartBeat, condition: .low),
//    Feedback(sentence: "Usain Bolt would be so proud of you!", type: .compliment, category: .heartBeat, condition: .high),
//    Feedback(sentence: "Try to explain your heart rate pressure to a doctor now...", type: .insult, category: .heartBeat, condition: .high),
//    
//    
//    Feedback(sentence: "You burned fewer calories than a sloth doing slow-motion yoga.", type: .insult, category: .calories, condition: .low),
//    Feedback(sentence: "Someone wanted to burn calories in an unorthodox way...", type: .compliment, category: .calories, condition: .high),
    
    
    

