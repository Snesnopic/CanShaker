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
                .foregroundStyle(Color.tertiaryGray)
                .overlay {
                    Image(achievement.imageName)
                        .resizable()
                        .padding(.all,50)
                }
            Text(achievement.title)
                .bold()
                .font(.title)
            Text(achievement.subTitle)
                .padding(.bottom)
                .font(.title2)
            Text(achievement.desc)
                .font(.title3)
            
            if achievement.isAchieved {
                Text("Date: \(achievement.achievingDate != nil ? "\(String(describing: achievement.achievingDate))" : "N/A")")
                    .font(.headline)
            }
            else {
                Text("Progress: \(achievement.completion)%")
                    .font(.headline)
            }
            
        }
        .padding()
        .preferredColorScheme(.dark)
        .multilineTextAlignment(.center)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Achievement.self, configurations: config)
    
    return AchievementDetailView(achievement: Achievement(title: "title1", subTitle: "subtitle1", desc: "You have shaked your can for 5 times a day!", completion: 33, isAchieved: false, imageName: "splashBlue"))
        .modelContainer(container)
}
