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
    let badge: String
    let title: String
    let subTitle: String
    let desc: String
    let completion: Int
    var achievingDate: Date?
    var isAchieved: Bool
    var imageName: String? = nil
    
    init(badge: String, title: String, subTitle: String, desc: String, completion: Int, achievingDate: Date? = nil, isAchieved: Bool, imageName: String? = nil) {
        self.badge = badge
        self.title = title
        self.subTitle = subTitle
        self.desc = desc
        self.completion = completion
        self.achievingDate = achievingDate
        self.isAchieved = isAchieved
    }
    static func ensureAchievementsExist(context:ModelContext, achievements:[Achievement]) {
        if achievements.isEmpty {
            do{
                let list = [
                    Achievement(badge: "", title: "title1", subTitle: "subtitle1", desc: "You have shaked your can for 5 times a day!", completion: 33, isAchieved: true, imageName: "flameRed"),
                    Achievement(badge: "", title: "title2", subTitle: "subtitle2", desc: "You have shaked your can really fast!", completion: 22, isAchieved: false),
                    Achievement(badge: "", title: "title3", subTitle: "subtitle3", desc: "Something something", completion: 84, isAchieved: true),
                    Achievement(badge: "", title: "title4", subTitle: "subtitle4", desc: "Something something", completion: 77, isAchieved: false),
                    Achievement(badge: "", title: "title5", subTitle: "subtitle5", desc: "Something something", completion: 99, isAchieved: false),
                    Achievement(badge: "", title: "title6", subTitle: "subtitle6", desc: "Something something", completion: 77, isAchieved: false)
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




