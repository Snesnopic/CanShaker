//
//  AchievementsView.swift
//  CanShaker
//
//  Created by Giuseppe Francione on 16/02/24.
//

import SwiftUI

struct AchievementsView: View {
    
    let achievedAchievements = Achievement.allAchievements.filter { $0.isAchieved }
    let groupedAchievements = stride(from: 0, to: Achievement.allAchievements.count, by: 3).map { Array(Achievement.allAchievements[$0..<min($0 + 3, Achievement.allAchievements.count)]) }
    @State var isPresented = false
    @State var selectedAchievement:Achievement? = nil
    @Namespace private var animation
    var body: some View {
        
        NavigationStack {
            Color(uiColor: UIColor.secondarySystemBackground).ignoresSafeArea().overlay {
                if !isPresented {
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
                else {
                    AchievementDetailView(animation: animation, achievement: $selectedAchievement, isPresented: $isPresented)
                }
                
                    
            }
            .navigationTitle("Achievements")
        }
    }
    
    var almostThere: some View {
        
        //TODO: The way it shows data is a placeholder
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
                    ZStack{
                        VStack() {
                            Circle()
                                .frame(width: 80, height: 80)
                                .matchedGeometryEffect(id: achievement.id, in: animation)
                            Text(achievement.title)
                                .font(.title3)
                                .matchedGeometryEffect(id: achievement.title, in: animation)
                            Text(achievement.subTitle)
                                .font(.subheadline)
                                .matchedGeometryEffect(id: achievement.subTitle, in: animation)
                        }
                        .padding()
                        .onTapGesture {
                            selectedAchievement = achievement
                            withAnimation {
                                isPresented = true
                            }
                        }
                        Text("\(achievement.completion)%")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .offset(y: -25)
                    }
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
            //TODO: It probably works fine while we will update .isAchieved, but idk
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
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.white)
                .padding()
            Text("Achievements list")
                .font(.title2)
                .fontWeight(.semibold)
                .offset(y: -190)
                .padding()
            HStack{
                VStack(alignment: .leading) {
                    ForEach(0..<groupedAchievements.count, id: \.self) { rowIndex in
                        HStack {
                            ForEach(groupedAchievements[rowIndex], id: \.id) { achievement in
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
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AchievementsView()
}
