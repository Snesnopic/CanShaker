//
//  Achievement.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 20/02/24.
//

import Foundation


class Achievement: Identifiable{
    let id: UUID = UUID()
    let badge: String
    let title: String
    let subTitle: String
    let description: String
    let completion: Int
    var isAchieved: Bool
    
    init(badge: String, title: String, subTitle: String, description: String, completion: Int, isAchieved: Bool) {
        self.badge = badge
        self.title = title
        self.subTitle = subTitle
        self.description = description
        self.completion = completion
        self.isAchieved = isAchieved
    }
}




