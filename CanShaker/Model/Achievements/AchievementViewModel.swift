//
//  AchievementViewModel.swift
//  CanShaker
//
//  Created by Davide Castaldi on 27/02/24.
//

import SwiftUI

struct AchievementViewModel: View {
    let achievement: Achievement
    let sorting: Int
    
    var body: some View {
        VStack {
            Circle()
                .frame(width: 80, height: 80)
                .foregroundStyle(.black)
            Text(achievement.title)
                .font(.title3)
                .fontWeight(.semibold)
            Text(achievement.subTitle)
                .font(.subheadline)
                .fontWeight(.semibold)
            Text(sorting == 1 ? "Completion: \(achievement.completion)%" : "Date: \(achievement.achievingDate != nil ? "\(achievement.achievingDate!)" : "N/A")")
                .font(.caption)
                .fontWeight(.bold)
        }
        .padding()
    }
}

#Preview {
    AchievementViewModel(achievement: Achievement(badge: "", title: "title1", subTitle: "subtitle1", description: "You have shaked your can for 5 times a day!", completion: 33, isAchieved: true), sorting: 1)
}
