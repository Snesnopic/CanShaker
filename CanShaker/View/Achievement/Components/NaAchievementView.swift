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
            NavigationLink(destination: AchievementDetailView(achievement: achievement), label: {
                Circle()
                    .responsiveFrame(widthPercentage: 25, aspectRatio: (1,1))
                    .foregroundStyle(Color.box.opacity(0.4))
                    .overlay {
                        Image(achievement.imageName)
                            .resizable()
                            .padding(.all)
                    }       
            })
            Spacer()
            VStack (alignment: .leading){
                Text(achievement.title)
                    .font(.title2)
                    .bold()
                Text(achievement.subTitle)
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 15.0)
                        .responsiveFrame(widthPercentage: 60,heightPercentage: 0.7)
                    RoundedRectangle(cornerRadius: 15.0)
                        .foregroundStyle(Color.accentColor)
                        .responsiveFrame(widthPercentage: (Double(achievement.completion) * 60.0) / 100.0,heightPercentage: 0.7)
                }
            }
            Spacer()
            
        }
        .padding(.all,30)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .responsiveFrame(widthPercentage: 95)
                .foregroundStyle(Color("boxColor"))
                .opacity(0.4)
                .responsiveFrame(widthPercentage: 95)
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
    return NaAchievementView(achievement: list.randomElement()!)
        .modelContainer(container)
}
