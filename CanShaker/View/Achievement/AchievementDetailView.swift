//
//  AchievementDetailView.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 20/02/24.
//

import SwiftUI
import SwiftData

struct AchievementDetailView: View {
    @State var achievement: Achievement
    var body: some View {

                VStack{
                        Circle()
                            .frame(width: 300, height: 300)
                            .foregroundStyle(.white)
                        Text(achievement.title)
                            .font(.title)
                            .foregroundStyle(.white)
                        Text(achievement.subTitle)
                            .font(.title2)
                            .foregroundStyle(.white)
                        Text(achievement.desc)
                            .font(.title3)
                            .foregroundStyle(.white)
                        Text("Progress: \(achievement.completion)%")
                            .font(.headline)
                    Text("Date: \(achievement.achievingDate != nil ? "\(String(describing: achievement.achievingDate))" : "N/A")")
                            .font(.headline)
                            .foregroundStyle(.white)
                    
                }
                .padding()
                .preferredColorScheme(.dark)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
            
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Achievement.self, configurations: config)

    return AchievementDetailView(achievement: Achievement(title: "title1", subTitle: "subtitle1", desc: "You have shaked your can for 5 times a day!", completion: 33, isAchieved: true))
        .modelContainer(container)
}
