//
//  AchievementsView.swift
//  CanShaker
//
//  Created by Giuseppe Francione on 16/02/24.
//

import SwiftUI

struct AchievementsView: View {
    
    let achievedAchievements = Achievement.list.filter { $0.isAchieved }
    let groupedAchievements = stride(from: 0, to: Achievement.list.count, by: 3).map { Array(Achievement.list[$0..<min($0 + 3, Achievement.list.count)]) }
    
    @State var isPresented = false
    @State var selectedAchievement:Achievement? = nil
    @Namespace private var animation
    var body: some View {
        
        NavigationStack {
            
            LinearGradient(gradient: Gradient(colors: [.lightBP, .darkBP]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea().overlay {
                if !isPresented {
                    ScrollView {
                        VStack() {
                            almostThere
                                .offset(y: 10)
                            listOfAchievements
                                
                        }
                    }
                }
                else {
                    AchievementDetailView(animation: animation, achievement: $selectedAchievement, isPresented: $isPresented)
                }
                
            }
            .preferredColorScheme(.dark)
            .navigationTitle("Achievements")
        }
        
    }
    
    var almostThere: some View {
        
        //TODO: The way it shows data is a placeholder
        ZStack(alignment: .leading){
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("boxColor"))
                .frame(width: 360, height: 200)
                .padding()
            Text("Almost There!")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .padding()
                .padding(.bottom, 150)
                .padding(.leading, 10)
            
            HStack{
                ForEach(Achievement.sortAlmostCompleted()) { achievement in
                    ZStack{
                        VStack() {
                            Circle()
                                .frame(width: 80, height: 80)
                                .foregroundStyle(.black)
                                .matchedGeometryEffect(id: achievement.id, in: animation)
                            Text(achievement.title)
                                .font(.title3)
                                .foregroundStyle(.white)
                            
                            Text(achievement.subTitle)
                                .font(.subheadline)
                                .foregroundStyle(.white)
                            
                        }
                        .padding(.top ,30)
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
                            .offset(y: -10)
                    }
                    .padding(.top, 10)
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
                .foregroundColor(Color("boxColor"))
                .frame(width: 360, height: .infinity)
                .padding()
            Text("All achievements")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .padding()
                .padding(.bottom, 500)
                .padding(.leading, 10)
            
            RoundedRectangle(cornerRadius: 6)
                .foregroundColor(.black)
                .frame(width: 128, height: 28)
                .padding()
                .padding(.bottom, 499)
                .padding(.leading, 220)
                .opacity(0.5)
            Picker(selection: .constant(1), label: Text("Picker")) {
                Text("All").tag(1)
                Text("Achieved").tag(2)
            }
            .pickerStyle(.segmented)
            .frame(width: 130)
            .padding(.bottom, 500)
            .padding(.leading, 234)
            
            HStack{
                VStack(alignment: .leading) {
                    ForEach(0..<groupedAchievements.count, id: \.self) { rowIndex in
                        HStack {
                            ForEach(groupedAchievements[rowIndex], id: \.id) { achievement in
                                VStack() {
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
                    }
                }
            }
            .padding(.top, 50)
            .padding()
        }
    }
}

#Preview {
    AchievementsView()
}
