//
//  Achievement.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 20/02/24.
//

import Foundation
import SwiftUI


class Achievement: Identifiable{
 
    
    let id: UUID
    let badge: String
    let title: String
    let subTitle: String
    let description: String
    let completion: Int
    var isAchieved: Bool
    
    init(id: UUID, badge: String, title: String, subTitle: String, description: String, completion: Int, isAchieved: Bool) {
        self.id = id
        self.badge = badge
        self.title = title
        self.subTitle = subTitle
        self.description = description
        self.completion = completion
        self.isAchieved = isAchieved
    }
}

extension Achievement {
    static let allAchievements = [
        Achievement(id: UUID(), badge: "", title: "title1", subTitle: "subtitle1", description: "You have shaked your can for 5 times a day!", completion: 33, isAchieved: false),
        Achievement(id: UUID(), badge: "", title: "title2", subTitle: "subtitle2", description: "You have shaked your can really fast!", completion: 22, isAchieved: false),
        Achievement(id: UUID(), badge: "", title: "title3", subTitle: "subtitle3", description: "Something something", completion: 84, isAchieved: true)
    ]
    
    static func sortAlmostCompleted() -> [Achievement] {
        let sortedAchievements = allAchievements.sorted { $0.completion > $1.completion }
        
        let almostCompleted = sortedAchievements.prefix(3)
        return Array(almostCompleted)
    }
    
    static func sortLastAchieved() -> [Achievement] {
        let sortedAchievements = allAchievements.sorted { $0.id.uuidString > $1.id.uuidString }
        return sortedAchievements
    }
}


