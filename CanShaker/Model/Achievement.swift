//
//  Achievement.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 20/02/24.
//

import Foundation

class Achievement: Identifiable{
    let id: UUID
    let badge: String
    let title: String
    let subTitle: String
    let description: String
    var isAchieved: Bool
    
    init(id: UUID, badge: String, title: String, subTitle: String, description: String, isAchieved: Bool) {
        self.id = id
        self.badge = badge
        self.title = title
        self.subTitle = subTitle
        self.description = description
        self.isAchieved = isAchieved
    }
}

extension Achievement {
    static let allAchievements = [
    Achievement(id: UUID(), badge: "", title: "Serial Shaker", subTitle: "5 times a day!", description: "You have shaked your can for 5 times a day!", isAchieved: false),
    Achievement(id: UUID(), badge: "", title: "Top Speed", subTitle: "Shaking speed is over 130km/h!", description: "You have shaked your can really fast!", isAchieved: false),
    Achievement(id: UUID(), badge: "", title: "Who goes slow stay healthy and goes far", subTitle: "Finish a session in over 1 hour", description: "Something something", isAchieved: false)
    ]
    
}
