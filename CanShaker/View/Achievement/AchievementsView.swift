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
    
    @State var filteringAchievements: Int = 0
    @State var isPresented = false
    @State var selectedAchievement:Achievement? = nil
    @Namespace private var animation
    var body: some View {
        
        NavigationStack {
            
            LinearGradient(gradient: Gradient(colors: [.lightBP, .darkBP]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea().overlay {
                    if !isPresented {
                        ScrollView {
                            VStack {
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
                    .frame(width: 360, height: 180)
                    .padding()
                Text("Almost There!")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding()
                    .padding(.bottom, 130)
                    .padding(.trailing, 195)
            }
            
            HStack{
                ForEach(Achievement.sortAlmostCompleted(prefixInt: 3)) { achievement in
                    ZStack{
                        AchievementViewModel(achievement: achievement, sorting: -1)
                        .padding(.top, 30)
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
                            .offset(y: -7)
                    }
                    .padding(.top, 10)
                }
            }
            .padding()
        }
    }
    
    var listOfAchievements: some View {
        
        ZStack(alignment: .leading) {
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("boxColor"))
                .frame(width: .infinity, height: .infinity)
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
                            Text("Progress").tag(3)
                        }
                        .tint(.white)
                        .padding(.trailing)
                        .offset(x: 15)
                    }
                }
                .padding()
                .offset(y: 20)
                switch filteringAchievements {
                case 1:
                    let achievements = Achievement.list
                    threeColumnDisplayAchievements(achievements: achievements)
                case 2:
                    let achievements = Achievement.sortLastAchieved()
                    threeColumnDisplayAchievements(achievements: achievements)
                case 3:
                    let achievements = Achievement.sortAlmostCompleted(prefixInt: nil)
                    threeColumnDisplayAchievements(achievements: achievements)
                    
                default:
                    let achievements = Achievement.list
                    threeColumnDisplayAchievements(achievements: achievements)
                }
            }
            .padding()
            .offset(y: -40)
        }
    }
    
    func threeColumnDisplayAchievements(achievements: [Achievement]) -> some View {
        let numberOfColumns = 3
        let numberOfRows = (achievements.count + numberOfColumns - 1) / numberOfColumns
        return VStack(alignment: .leading) {
            ForEach(0..<numberOfRows, id: \.self) { rowIndex in
                HStack {
                    ForEach(0..<numberOfColumns, id: \.self) { columnIndex in
                        let index = rowIndex * numberOfColumns + columnIndex
                        if index < achievements.count {
                            AchievementViewModel(achievement: achievements[index], sorting: filteringAchievements)
                        }
                    }
                }
            }
        }
    }
}






#Preview {
    AchievementsView()
}
