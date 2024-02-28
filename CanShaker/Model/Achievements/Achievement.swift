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
    
    init(badge: String, title: String, subTitle: String, desc: String, completion: Int, achievingDate: Date? = nil, isAchieved: Bool) {
        self.badge = badge
        self.title = title
        self.subTitle = subTitle
        self.desc = desc
        self.completion = completion
        self.achievingDate = achievingDate
        self.isAchieved = isAchieved
    }
}




