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
            ScrollView {
                VStack{
                    HStack{
                        Text("Near accomplishment")
                            .bold()
                            .font(.title2)
                            .padding(.top, 25)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    NaAchievementView(achievement: achievements.filter({ achievement in
                        return !achievement.isAchieved
                    }).sorted(by: { achievement1, achievement2 in
                        return achievement1.completion > achievement2.completion
                    }).first!)
                    
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
                
                
            }
            .navigationTitle("Achievements")
            .frame(maxWidth: .infinity)
            .background{
                Color(Color("bgGray"))
            }
        }
        .preferredColorScheme(.dark)
        
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Achievement.self, configurations: config)
    let list = [
        Achievement(title: "Heroic Shaker", subTitle: "Master of Motion", desc: "You've shaken your can over 1000 times! Keep it up!", completion: 0, isAchieved: false, imageName: "splashBlue"),
        Achievement(title: "Steady Rhythm", subTitle: "No Moment of Pause", desc: "You've maintained a steady average speed for over 30 minutes!", completion: 0, isAchieved: false, imageName: "flameRed"),
        Achievement(title: "Race Against Time", subTitle: "Fast as the Wind", desc: "You've reached an average speed of over 15 km/h!", completion: 0, isAchieved: false, imageName: "flameRed"),
        Achievement(title: "Calm Heartbeat", subTitle: "State of Relaxation", desc: "You've maintained a heartbeat below 100 bpm throughout the entire session!", completion: 0, isAchieved: false, imageName: "splashBlue"),
        Achievement(title: "Persistence", subTitle: "Never Give Up!", desc: "You've used the app for more than 7 consecutive days!", completion: 7, isAchieved: false, imageName: "splashBlue"),
        Achievement(title: "Master of Energy", subTitle: "Heartbeats, Calories, Speed!", desc: "You've achieved a perfect score on all metrics: heartbeats, burned calories, and speed!", completion: 0, isAchieved: false, imageName: "flameRed")
    ]
    list.forEach { achievement in
        container.mainContext.insert(achievement)
    }
    return AchievementsView(selectedAchievement: (Achievement(title: "", subTitle: "", desc: "", completion: 0, isAchieved: false, imageName: "splashBlue")))
        .modelContainer(container)
}
