//
//  AllAchievementsView.swift
//  CanShaker
//
//  Created by Davide Castaldi on 27/02/24.
//

import SwiftUI

struct AllAchievementsView: View {
    
    @State var filteringAchievements: Int = 0
    
    var body: some View {
        
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
    AllAchievementsView()
}
