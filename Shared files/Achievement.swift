//
//  Achievement.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 20/02/24.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class Achievement: Identifiable{
    let id: UUID = UUID()
    let title: String
    let subTitle: String
    let desc: String
    let completion: Int
    var achievingDate: Date?
    var isAchieved: Bool
    var imageName: String
    
    init(title: String, subTitle: String, desc: String, completion: Int, achievingDate: Date? = nil, isAchieved: Bool, imageName: String) {
        self.title = title
        self.subTitle = subTitle
        self.desc = desc
        self.completion = completion
        if isAchieved && achievingDate == nil{
            self.achievingDate = Date()
        }
        else {
            self.achievingDate = achievingDate
        }
        self.isAchieved = isAchieved
        self.imageName = imageName
    }
    static func ensureAchievementsExist(context:ModelContext, achievements:[Achievement]) {
        if achievements.isEmpty {
            do{
                let list = [
                    Achievement(title: String(localized: "Heroic Shaker"), subTitle: String(localized: "Master of Motion"), desc: String(localized: "You've shaken your can over 1000 times! Keep it up!"), completion: 0, isAchieved: false, imageName: "splashBlue"),
                    Achievement(title: String(localized: "Steady Rhythm"), subTitle: String(localized: "No Moment of Pause"), desc: String(localized: "You've maintained a steady average speed for over 30 minutes!"), completion: 0, isAchieved: false, imageName: "flameRed"),
                    Achievement(title: String(localized: "Race Against Time"), subTitle: String(localized: "Fast as the Wind"), desc: String(localized: "You've reached an average speed of over 15 km/h!"), completion: 0, isAchieved: false, imageName: "flameRed"),
                    Achievement(title: String(localized: "Calm Heartbeat"), subTitle: String(localized: "State of Relaxation"), desc: String(localized: "You've maintained a heartbeat below 100 bpm throughout the entire session!"), completion: 0, isAchieved: false, imageName: "splashBlue"),
                    Achievement(title: String(localized: "Persistence"), subTitle: String(localized: "Never Give Up!"), desc: String(localized: "You've used the app for more than 7 consecutive days!"), completion: 7, isAchieved: false, imageName: "splashBlue"),
                    Achievement(title: String(localized: "Master of Energy"), subTitle: String(localized: "Heartbeats, Calories, Speed!"), desc: String(localized: "You've achieved a perfect score on all metrics: heartbeats, burned calories, and speed!"), completion: 0, isAchieved: false, imageName: "flameRed")
                ]
                list.forEach { achievement in
                    context.insert(achievement)
                }
                try context.save()
            }
            catch{
                fatalError("\(error)")
            }
        }
    }
}




