//
//  AchievementViewModel.swift
//  CanShaker
//
//  Created by Davide Castaldi on 27/02/24.
//

import Foundation
import SwiftUI
struct AchievementView: View {
    let achievement: Achievement
    
    var body: some View {
        VStack {
            Circle()
                .frame(width: 80, height: 80)
                .foregroundStyle(.black)
            Text(achievement.title)
                .font(.title3)
            Text(achievement.subTitle)
                .font(.subheadline)
        }
        .padding()
    }
}
