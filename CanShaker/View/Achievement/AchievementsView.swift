//
//  AchievementsView.swift
//  CanShaker
//
//  Created by Giuseppe Francione on 16/02/24.
//

import SwiftUI
import SwiftData

struct AchievementsView: View{
    @State var selectedAchievement: Achievement?
    @Query var achievements: [Achievement]
    @Environment(\.modelContext) var context
    var body: some View{
        NavigationStack{
            
            VStack{
                HStack{
                    Text("Near accomplishment")
                        .bold()
                        .font(.title2)
                        .padding(.top, 25)

                    Spacer()
                }
                .padding(.horizontal)
                NaAchievementView()
                
                HStack{
                    Text("All achievements")
                        .bold()
                        .font(.title2)
                        .padding(.top, 25)
                    Spacer()
                }
                .padding(.horizontal)
                
                AllAchievementsView()
                Spacer()
            }
            .navigationTitle("Achievements")
        }
        
        .preferredColorScheme(.dark)
        .onAppear {
            Achievement.ensureAchievementsExist(context: context, achievements: achievements)
        }
        
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Achievement.self, configurations: config)

    let preview = Achievement(badge: "", title: "title1", subTitle: "subtitle1", desc: "You have shaked your can for 5 times a day!", completion: 33, isAchieved: true)
    return AchievementsView( selectedAchievement: (Achievement(badge: "", title: "", subTitle: "", desc: "", completion: 0, isAchieved: false)))
        .modelContainer(container)
}
