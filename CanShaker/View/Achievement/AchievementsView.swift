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
                .padding(.horizontal)
                
                AllAchievementsView()
                Spacer()
            }
            
        }
        .navigationTitle("Achievements")
        .preferredColorScheme(.dark)
        
    }
}

#Preview {
    AchievementsView( selectedAchievement: (Achievement(badge: "", title: "", subTitle: "", description: "", completion: 0, isAchieved: false)))
}
