//
//  AchievementList.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 25/02/24.
//

import Foundation

extension Achievement {
    static let list = [
        Achievement(badge: "", title: "title1", subTitle: "subtitle1", desc: "You have shaked your can for 5 times a day!", completion: 33, isAchieved: true),
        Achievement(badge: "", title: "title2", subTitle: "subtitle2", desc: "You have shaked your can really fast!", completion: 22, isAchieved: false),
        Achievement(badge: "", title: "title3", subTitle: "subtitle3", desc: "Something something", completion: 84, isAchieved: true),
        Achievement(badge: "", title: "title4", subTitle: "subtitle4", desc: "Something something", completion: 77, isAchieved: false),
        Achievement(badge: "", title: "title5", subTitle: "subtitle5", desc: "Something something", completion: 99, isAchieved: false),
        Achievement(badge: "", title: "title6", subTitle: "subtitle6", desc: "Something something", completion: 77, isAchieved: false)
       
    ]
    
    static func sortAlmostCompleted(prefixInt: Int!) -> [Achievement] {
        let sortedAchievements = list.sorted { $0.completion > $1.completion }
        
        if (prefixInt == nil) {
            return sortedAchievements
        } else {
            let almostCompleted = sortedAchievements.prefix(3)
            return Array(almostCompleted)
        }
    }
    
    static func sortLastAchieved() -> [Achievement] {
        let sortedAchievements = list.sorted { $0.id.uuidString > $1.id.uuidString }
        return sortedAchievements
    }
    
    
}
