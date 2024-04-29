//
//  NaAchievementView.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 27/02/24.
//

import SwiftUI
import SwiftData
struct NaAchievementView: View {
    var achievement:Achievement
    var body: some View {
        HStack{
            NavigationLink {
                AchievementDetailView(achievement: achievement)
            } label: {
                Circle()
                    .responsiveFrame(widthPercentage: 25, aspectRatio: (1,1))
                    .foregroundStyle(Color.boxDetail)
                    .overlay {
                        Image(achievement.imageName)
                            .resizable()
                            .padding(.all)
                    }
            }
            Spacer()
            VStack (alignment: .leading){
                Text(achievement.title)
                    .font(.title2)
                    .bold()
                Text(achievement.subTitle)
                ProgressView(value: Double(achievement.completion) / 100.0)
            }
            Spacer()
            
        }
        .padding(.all,30)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(Color.box)
                .padding(.horizontal)
        }
        .preferredColorScheme(.dark)
    }
}


#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Achievement.self, configurations: config)
    let list = [
        Achievement(title: "Heroic Shaker", subTitle: "Master of Motion", desc: "You've shaken your can over 1000 times! Keep it up!", completion: 50, isAchieved: false, imageName: "splashBlue"),
        Achievement(title: "Steady Rhythm", subTitle: "No Moment of Pause", desc: "You've maintained a steady average speed for over 30 minutes!", completion: 25, isAchieved: false, imageName: "flameRed"),
        Achievement(title: "Race Against Time", subTitle: "Fast as the Wind", desc: "You've reached an average speed of over 15 km/h!", completion: 12, isAchieved: false, imageName: "flameRed"),
        Achievement(title: "Calm Heartbeat", subTitle: "State of Relaxation", desc: "You've maintained a heartbeat below 100 bpm throughout the entire session!", completion: 75, isAchieved: false, imageName: "splashBlue"),
        Achievement(title: "Persistence", subTitle: "Never Give Up!", desc: "You've used the app for more than 7 consecutive days!", completion: 80, isAchieved: false, imageName: "splashBlue"),
        Achievement(title: "Master of Energy", subTitle: "Heartbeats, Calories, Speed!", desc: "You've achieved a perfect score on all metrics: heartbeats, burned calories, and speed!", completion: 90, isAchieved: false, imageName: "flameRed")
    ]
    list.forEach { achievement in
        container.mainContext.insert(achievement)
    }
    let achievement = list.randomElement()!
    print("Completion: \(achievement.completion)")
    return NaAchievementView(achievement: achievement)
        .modelContainer(container)
}
