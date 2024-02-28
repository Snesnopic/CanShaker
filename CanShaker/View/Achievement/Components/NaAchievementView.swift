//
//  NaAchievementView.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 27/02/24.
//

import SwiftUI

struct NaAchievementView: View {
    @State private var naAchievements: [Achievement] = []
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15.0)
                .responsiveFrame(widthPercentage: 95, heightPercentage: 18)
                .foregroundStyle(Color("boxColor"))
                .opacity(0.4)
                .shadow(radius: 20)
            HStack{
                ForEach(naAchievements){ achievement in
                    
                    NavigationLink(destination: AchievementDetailView(achievement: achievement), label: {
                        AchievementStyle(title: achievement.title)
                    })
                    .padding()
                    
                }
            }
            .onAppear{
                naAchievements = Achievement.list.sorted { $0.completion > $1.completion }
                naAchievements = Array(naAchievements.prefix(3))
            }
            
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    NaAchievementView()
}
