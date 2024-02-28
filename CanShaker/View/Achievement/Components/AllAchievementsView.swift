//
//  AllAchievementsView.swift
//  CanShaker
//
//  Created by Davide Castaldi on 27/02/24.
//

import SwiftUI

struct AllAchievementsView: View {
    
    let col = [
        GridItem(.adaptive(minimum: 100))
    ]
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .responsiveFrame(widthPercentage: 95, heightPercentage: 35)
                    .foregroundStyle(Color("boxColor"))
                    .opacity(0.2)
                
                VStack{
    
                    
                    
                    LazyVGrid(columns: col, spacing: 40){
                        ForEach(Achievement.list){ achievement in
                            NavigationLink(destination: AchievementDetailView(achievement: achievement), label: {
                                AchievementStyle(title: achievement.title)
                            })
                        }
                    }
                    .padding(.horizontal)
                    
                }
                .responsiveFrame(widthPercentage: 95, heightPercentage: 35)
                
            }
        }
    }
    
}



#Preview {
    AllAchievementsView()
}
