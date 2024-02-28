//
//  AchievementsView.swift
//  CanShaker
//
//  Created by Giuseppe Francione on 16/02/24.
//

import SwiftUI


struct AchievementsView: View{
    @State var selectedAchievement: Achievement =  (Achievement(badge: "", title: "", subTitle: "", description: "", completion: 0, isAchieved: false))
    var body: some View{
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.lightBP, .darkBP]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack{
                    HStack{
                        Text("Near accomplishment")
                            .bold()
                            .font(.title2)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    NaAchievementView()
                    
                    HStack{
                        Text("All achievements")
                            .bold()
                            .font(.title2)
                        
                        Spacer()
                    }
                    .padding(.top, 25)
                    .padding(.horizontal)
                    
                    AllAchievementsView()
                    Spacer()
                }
                .padding(.top, 25)
                
            }
            .navigationTitle("Achievements")
        }
        .preferredColorScheme(.dark)
        
    }
}

#Preview {
    AchievementsView( selectedAchievement: (Achievement(badge: "", title: "", subTitle: "", description: "", completion: 0, isAchieved: false)))
}
