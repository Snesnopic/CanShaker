//
//  BadgeObtainedView.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 16/02/24.
//

import SwiftUI

struct BadgeObtainedView: View {
    @State var achievement:Achievement
    var body: some View {
        NavigationStack {
            Circle().foregroundStyle(achievement.color).overlay(content: {
                VStack {
                    Image(systemName: "trophy")
                        .foregroundStyle(.black)
                        .font(.largeTitle)
                    Text("\(achievement.title)!")
                        .foregroundStyle(.black)
                }
                
            })
            .navigationTitle("New achievement!")
        }
    }
}

#Preview {
    BadgeObtainedView(achievement: Achievement.allAchievements.randomElement()!)
}
