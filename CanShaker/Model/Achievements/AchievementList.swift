//
//  AchievementList.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 25/02/24.
//

import Foundation

extension Achievement {
    static let list = [
        Achievement(badge: "", title: "title1", subTitle: "subtitle1", description: "You have shaked your can for 5 times a day!", completion: 33, isAchieved: true),
        Achievement(badge: "", title: "title2", subTitle: "subtitle2", description: "You have shaked your can really fast!", completion: 22, isAchieved: false),
        Achievement(badge: "", title: "title3", subTitle: "subtitle3", description: "Something something", completion: 84, isAchieved: true),
        Achievement(badge: "", title: "title4", subTitle: "subtitle4", description: "Something something", completion: 77, isAchieved: false),
        Achievement(badge: "", title: "title5", subTitle: "subtitle5", description: "Something something", completion: 99, isAchieved: false),
        Achievement(badge: "", title: "title6", subTitle: "subtitle6", description: "Something something", completion: 77, isAchieved: false),
        Achievement(badge: "", title: "title7", subTitle: "subtitle7", description: "Something something", completion: 99, isAchieved: false)
    ]
    
    static func sortAlmostCompleted() -> [Achievement] {
        let sortedAchievements = list.sorted { $0.completion > $1.completion }
        
        let almostCompleted = sortedAchievements.prefix(3)
        return Array(almostCompleted)
    }
    
    static func sortLastAchieved() -> [Achievement] {
        let sortedAchievements = list.sorted { $0.id.uuidString > $1.id.uuidString }
        return sortedAchievements
    }
    
    
}
