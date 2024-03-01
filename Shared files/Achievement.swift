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
                    Achievement(title: "Heroic Shaker", subTitle: "Master of Motion", desc: "You've shaken your can over 1000 times! Keep it up!", completion: 0, isAchieved: false, imageName: "splashBlue"),
                    Achievement(title: "Steady Rhythm", subTitle: "No Moment of Pause", desc: "You've maintained a steady average speed for over 30 minutes!", completion: 0, isAchieved: false, imageName: "flameRed"),
                    Achievement(title: "Race Against Time", subTitle: "Fast as the Wind", desc: "You've reached an average speed of over 15 km/h!", completion: 0, isAchieved: false, imageName: "flameRed"),
                    Achievement(title: "Calm Heartbeat", subTitle: "State of Relaxation", desc: "You've maintained a heartbeat below 100 bpm throughout the entire session!", completion: 0, isAchieved: false, imageName: "splashBlue"),
                    Achievement(title: "Persistence", subTitle: "Never Give Up!", desc: "You've used the app for more than 7 consecutive days!", completion: 7, isAchieved: false, imageName: "splashBlue"),
                    Achievement(title: "Master of Energy", subTitle: "Heartbeats, Calories, Speed!", desc: "You've achieved a perfect score on all metrics: heartbeats, burned calories, and speed!", completion: 0, isAchieved: false, imageName: "flameRed")
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




