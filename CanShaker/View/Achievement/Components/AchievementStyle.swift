//
//  AchievementStyle.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 28/02/24.
//

import SwiftUI
import SwiftData

struct AchievementStyle: View {
    @State var achievement: Achievement
    var body: some View {
        VStack{
            Circle()
                .responsiveFrame(widthPercentage: 20, aspectRatio: (1,1))
                .foregroundStyle(Color.tertiaryGray)
                .overlay {
                    Image(achievement.imageName)
                        .resizable()
                        .padding(.all)
                }
            
            Text(achievement.title)
                .foregroundStyle(Color.primary)
                .font(.callout)
                .padding(.horizontal)
                .lineLimit(2)
            Spacer()
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Achievement.self, configurations: config)
    return AchievementStyle(achievement: Achievement(title: "prova", subTitle: "prova", desc: "prova", completion: 53, achievingDate: nil, isAchieved: false, imageName: "splashBlue"))
        .modelContainer(container)
}
