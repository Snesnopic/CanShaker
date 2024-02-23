//
//  Badges.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 19/02/24.
//

import Foundation
import SwiftUI


func generateBadges(num: Int) -> [Badge]{
    var allBadges: [Badge] = []
    for i in 1...num {
        allBadges.append(Badge(name: "Badge \(i)", color: Color.random(), description: "Description \(i)"))
    }
    return allBadges
}
var allBadges: [Badge] = generateBadges(num: 40)
