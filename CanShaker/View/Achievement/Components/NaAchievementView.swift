//
//  NaAchievementView.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 27/02/24.
//

import SwiftUI
import SwiftData
struct NaAchievementView: View {
    @Query private var achievements: [Achievement]
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15.0)
                .responsiveFrame(widthPercentage: 95, heightPercentage: 18)
                .foregroundStyle(Color("boxColor"))
                .opacity(0.4)
                .shadow(radius: 20)
            HStack{
                ForEach(achievements.sorted {$0.completion > $1.completion}.prefix(3)){ achievement in
                    
                    NavigationLink(destination: AchievementDetailView(achievement: achievement), label: {
                        AchievementStyle(title: achievement.title)
                    })
                    .padding()
                    
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    NaAchievementView()
}
