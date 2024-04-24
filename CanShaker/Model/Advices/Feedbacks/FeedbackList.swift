//
//  FeedbackList.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 25/02/24.
//

import Foundation

extension Feedback {
    static let list = [
        
        //MARK: DURATION
        //low
        Feedback(sentence: String(localized: "You were so fast that Flash had to change job!"), type: .insult, category: .duration, condition: .low, imageName: "figure.run"),
        Feedback(sentence: String(localized: "Ever heard of 'Achille and the tortoise'? Guess who you are."), type: .insult, category: .duration, condition: .low, imageName: "figure.run"),
        
        //high
        //i think this could be changed in "Flash is feeling jealous."
        Feedback(sentence: String(localized: "It looks like we have a marathon runner here!"), type: .compliment, category: .duration, condition: .high, imageName: "figure.run"),
        Feedback(sentence: String(localized:"Are you still watching?"), type: .compliment, category: .duration, condition: .high, imageName: "figure.run"),
        
        //MARK: HEARTBEAT
        //low
        Feedback(sentence: String(localized: "Your heartbeat is so chill, even a meditation guru would envy your cardio-nap routine!"), type: .compliment, category: .heartBeat, condition: .low, imageName: "heart.fill"),
        Feedback(sentence: String(localized:"Impressive dedication to the craft, my friend."), type: .insult, category: .heartBeat, condition: .low, imageName: "heart.fill"),
        
        //high
        Feedback(sentence: String(localized: "Try to explain your heart rate to a doctor now..."), type: .insult, category: .heartBeat, condition: .high, imageName: "heart.fill"),
        Feedback(sentence: String(localized: "Wow, your heartbeat is so fast, I bet even Usain Bolt would struggle to keep up with it in a sprint!"), type: .compliment, category: .heartBeat, condition: .high, imageName: "heart.fill"),

        //MARK: CALORIES
        //low
        Feedback(sentence: String(localized: "You burned fewer calories than a sloth doing slow-motion yoga."), type: .insult, category: .calories, condition: .low, imageName: "flame.fill"),
        Feedback(sentence: String(localized: "Oh so that's why you got the gym membership!"), type: .insult, category: .calories, condition: .low, imageName: "flame.fill"),
        
        //high
        Feedback(sentence: String(localized: "Someone wanted to burn calories in an unorthodox way..."), type: .compliment, category: .calories, condition: .high, imageName: "flame.fill"),
        Feedback(sentence: String(localized: "Oh so that's why you got the gym membership!"), type: .compliment, category: .calories, condition: .high, imageName: "flame.fill"),
        
        //MARK: ACCEL
        //low
        Feedback(sentence: String(localized: "Slow and steady wins the race."), type: .insult, category: .accel, condition: .low, imageName: "bolt.fill"),
        Feedback(sentence: String(localized: "Was that a funeral procession? Oh, you missed it for how slow you were."), type: .insult, category: .accel, condition: .low, imageName: "bolt.fill"),
        
        //high
        Feedback(sentence: String(localized: "Are you shaking it like your life depends on it?!"), type: .compliment, category: .accel, condition: .high, imageName: "bolt.fill"),
        Feedback(sentence: String(localized: "'Deja vù! I've just  been in this place before'"), type: .compliment, category: .accel, condition: .high, imageName: "bolt.fill"),
        
        //MARK: RANDOM & EASTER EGGS
        //random
        Feedback(sentence: "Ascanio?!", type: .neutral, category: .random, condition: .random, imageName: "sunset.fill"),
        Feedback(sentence: String(localized: "There are clouds above your head, everybody knows your deed."), type: .neutral, category: .random, condition: .random, imageName: "sunset.fill"),
        
        //easter eggs
        Feedback(sentence: String(localized: "69? Nice"), type: .neutral, category: .easterEgg, condition: .random, imageName: "♋️")
        
    ]
}
