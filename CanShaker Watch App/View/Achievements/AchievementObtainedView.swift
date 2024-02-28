//
//  AchievementObtainedView.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 16/02/24.
//

import SwiftUI

struct AchievementObtainedView: View {
    @State var achievement:Achievement
    var body: some View {
        NavigationStack {
            Circle().foregroundStyle(Color.random()).overlay(content: {
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
    AchievementObtainedView(achievement: Achievement(badge: "", title: "title1", subTitle: "subtitle1", desc: "You have shaked your can for 5 times a day!", completion: 33, isAchieved: true))
}
