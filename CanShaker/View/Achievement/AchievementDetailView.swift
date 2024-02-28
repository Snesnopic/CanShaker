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
                        Text(achievement!.subTitle)
                            .font(.title2)
                        Text(achievement!.description)
                            .font(.title3)
                        Text("Progress: \(achievement!.completion)%")
                            .font(.headline)
                        Text("Date: \(achievement!.achievingDate != nil ? "\(achievement!.achievingDate!)" : "N/A")")
                            .font(.headline)
                    }
                }
                .padding()
                .foregroundStyle(.white)
            }
            .padding()
        
    }
}

#Preview {
    let achievement = Binding<Achievement?>.constant(Achievement(badge: "", title: "Title", subTitle: "Subtitle", description: "DescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescription", completion: 50, isAchieved: true))
    return AchievementDetailView(achievement: achievement)
}
