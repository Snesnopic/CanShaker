//
//  AchievementDetailView.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 20/02/24.
//

import SwiftUI

struct AchievementDetailView: View {
    @Binding var achievement: Achievement?
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [.lightBP, .darkBP]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea().overlay {
                VStack{
                    if achievement != nil {
                        Circle()
                            .frame(width: 300, height: 300)
                            .foregroundStyle(.black)
                        Text(achievement!.title)
                            .font(.title)
                            .foregroundStyle(.white)
                        Text(achievement!.subTitle)
                            .font(.title2)
                            .foregroundStyle(.white)
                        Text(achievement!.description)
                            .font(.title3)
                            .foregroundStyle(.white)
                        Text("Progress: \(achievement!.completion)%")
                            .font(.headline)
                        Text("Date: \(achievement!.achievingDate != nil ? "\(achievement!.achievingDate!)" : "N/A")")
                            .font(.headline)
                            .foregroundStyle(.white)
                    }
                }
                
                .foregroundStyle(.white)
            }
        
    }
}

//#Preview {
//    AchievementDetailView(animation: Namespace.wrappedValue,achievement: Achievement(id: UUID(), badge: "", title: "title1", subTitle: "subtitle1", description: "You have shaked your can for 5 times a day!", completion: 33, isAchieved: true))
//}
