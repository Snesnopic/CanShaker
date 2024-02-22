//
//  AchievementsView.swift
//  CanShaker
//
//  Created by Giuseppe Francione on 16/02/24.
//

import SwiftUI

struct AchievementsView: View {
    
    let achievedAchievements = Achievement.allAchievements.filter { $0.isAchieved }
    
    
        
    var body: some View {
        
        NavigationStack {
            Color(uiColor: UIColor.secondarySystemBackground).ignoresSafeArea().overlay {
                
                ScrollView {
                    VStack() {
                        almostThere
                            .offset(y: 40)
                        recentlyCompleted
                            .offset(y: 70)
                        listOfAchievements
                            .offset(y: 100)
                    }
                }
            }
            .navigationTitle("Achievements")
        }
    }
    
    var almostThere: some View {
        
        //TODO: needs to show the 3 closer to completion
        ZStack(alignment: .leading){
            Text("Almost There!")
                .font(.title2)
                .fontWeight(.semibold)
                .offset(y: -105)
                .padding()
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.white)
                .padding()
            HStack{
                ForEach(Achievement.sortAlmostCompleted()) { achievement in
                    VStack() {
                        Circle()
                            .frame(width: 80, height: 80)
                        Text(achievement.title)
                            .font(.title3)
                        Text(achievement.subTitle)
                            .font(.subheadline)
                    }
                    .padding()
                }
            }
            .padding()
        }
    }
    
    var recentlyCompleted: some View {
        
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.white)
                .padding()
            Text("Recently achieved")
                .font(.title2)
                .fontWeight(.semibold)
                .offset(y: -105)
                .padding()
            //TODO: this is to prevent the first time the users uses the app to see achievements that he didn't acquire, needs to conform to only last 3 achieved
            if(!achievedAchievements.isEmpty) {
                HStack{
                    ForEach(achievedAchievements){ achievement in
                        VStack() {
                            Circle()
                                .frame(width: 80, height: 80)
                            Text(achievement.title)
                                .font(.title3)
                            Text(achievement.subTitle)
                                .font(.subheadline)
                            
                            
                        }
                        .padding()
                    }
                }
                .padding()
            }
        }
    }
    
    var listOfAchievements: some View {
        
        ZStack(alignment: .leading){
            Text("More Achievements")
                .font(.title2)
                .fontWeight(.semibold)
                .offset(y: -105)
                .padding()
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.white)
                .padding()
            HStack{
                ForEach(Achievement.allAchievements){ achievement in
                    VStack() {
                        Circle()
                            .frame(width: 80, height: 80)
                        Text(achievement.title)
                            .font(.title3)
                        Text(achievement.subTitle)
                            .font(.subheadline)
                    }
                    .padding()
                }
            }
            .padding()
        }
    }
}

#Preview {
    AchievementsView()
}
