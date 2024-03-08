//
//  AllAchievementsView.swift
//  CanShaker
//
//  Created by Davide Castaldi on 27/02/24.
//

import SwiftUI
import SwiftData

struct AllAchievementsView: View {
    @Query private var achievements:[Achievement]
    let col = [
        GridItem(.adaptive(minimum: 100))
    ]
    var body: some View {
        VStack{
            LazyVGrid(columns: col, spacing: 40){
                ForEach(achievements){ achievement in
                    NavigationLink(destination: AchievementDetailView(achievement: achievement), label: {
                        AchievementStyle(achievement: achievement)
                    })
                    
                }
            }
            .padding(.all)
            
        }.background {
            RoundedRectangle(cornerRadius: 15)
                .responsiveFrame(widthPercentage: 95)
                .foregroundStyle(Color.box)
                .responsiveFrame(widthPercentage: 95)

        }
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
    return AllAchievementsView()
        .modelContainer(container)
}
