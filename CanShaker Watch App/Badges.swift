//
//  Badges.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 19/02/24.
//

import Foundation
import SwiftUI

func randomColor() -> Color {
    return Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
}
func generateBadges(num: Int) -> [Badge]{
    var allBadges: [Badge] = []
    for i in 1...num {
        allBadges.append(Badge(name: "Badge \(i)", color: randomColor(), description: "Description \(i)"))
    }
    return allBadges
}
var allBadges: [Badge] = generateBadges(num: 40)
