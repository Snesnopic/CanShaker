//
//  Achievement.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 20/02/24.
//

import Foundation
import SwiftUI

class Achievement: Identifiable{
    let id: UUID = UUID()
    let badge: String
    let title: String
    let subTitle: String
    let description: String
    let completion: Int
    let color: Color = Color.random()
    var achievingDate: Date?
    var isAchieved: Bool
    
    init(badge: String, title: String, subTitle: String, description: String, completion: Int, achievingDate: Date? = nil, isAchieved: Bool) {
        self.badge = badge
        self.title = title
        self.subTitle = subTitle
        self.description = description
        self.completion = completion
        self.achievingDate = achievingDate
        self.isAchieved = isAchieved
    }
}




