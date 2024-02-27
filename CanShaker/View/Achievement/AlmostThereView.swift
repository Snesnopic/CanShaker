//
//  AlmostThereView.swift
//  CanShaker
//
//  Created by Davide Castaldi on 27/02/24.
//

import SwiftUI

struct AlmostThereView: View {
    
    @State var isPresented = false
    @State var selectedAchievement: Achievement? = nil
    @Namespace private var animation
    
    var body: some View {
        
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
}

#Preview {
    AlmostThereView()
}
