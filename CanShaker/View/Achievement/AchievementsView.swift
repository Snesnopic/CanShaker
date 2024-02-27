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
    
    
    
    var filteredAchievements: [Achievement] {
        filteringAchievements == 1 ? Achievement.list : (filteringAchievements == 2 ? achievedAchievements : [])
    }
    
    @State private var filteringAchievements: Int = 0
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
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color("boxColor"))
                    .frame(width: 360, height: 200)
                    .padding()
                Text("Almost There!")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding()
                    .padding(.bottom, 145)
                    .padding(.trailing, 195)
            }
            
            HStack{
                ForEach(Achievement.sortAlmostCompleted()) { achievement in
                    ZStack{
                        VStack {
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
        
        ZStack(alignment: .leading) {
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("boxColor"))
                .frame(width: 360, height: .infinity)
                .padding()
            VStack{
                HStack{
                    Text("All achievements")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    Spacer()
                    ZStack{
                        RoundedRectangle(cornerRadius: 6)
                            .foregroundColor(.black)
                            .frame(width: 100, height: 30)
                            .padding()
                            .padding(.trailing)
                            .opacity(0.5)
                            .offset(x: 15)
                        
                        Picker(selection: $filteringAchievements, label: Text("Picker")) {
                            Text("All").tag(1)
                            Text("Achieved").tag(2)
                        }
                        .tint(.white)
                        .padding(.trailing)
                        .offset(x: 15)
                    }
                }
                .padding()
                
                HStack{
                    VStack(alignment: .leading) {
                        switch filteringAchievements {
                        case 1:
                            let achievements = Achievement.sortAlmostCompleted()
                            displayAchievementsInThreeColumns(achievements: achievements)
                        case 2:
                            let achievements = Achievement.sortLastAchieved()
                            displayAchievementsInThreeColumns(achievements: achievements)
                        default:
                            let achievements = Achievement.sortAlmostCompleted()
                            displayAchievementsInThreeColumns(achievements: achievements)
                        }
                    }
                }
            }
            .padding()
            .offset(y: -20)
        }
    }
}


func displayAchievementsInThreeColumns(achievements: [Achievement]) -> some View {
    let numberOfColumns = 3
    let numberOfRows = (achievements.count + numberOfColumns - 1) / numberOfColumns
    return ForEach(0..<numberOfRows) { rowIndex in
        HStack {
            ForEach(0..<numberOfColumns) { columnIndex in
                let index = rowIndex * numberOfColumns + columnIndex
                if index < achievements.count {
                    AchievementViewModel(achievement: achievements[index])
                }
            }
        }

    }
}


#Preview {
    AchievementsView()
}
