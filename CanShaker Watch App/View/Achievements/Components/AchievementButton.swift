//
//  AchievementButton.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 29/02/24.
//

import SwiftUI
import SwiftData

struct AchievementButton: View {
    @Binding var selectedAchievement: Achievement?
    var achievement: Achievement
    @Binding var isPresented: Bool
    var animation: Namespace.ID

    var body: some View {
        Button(action: {
            selectedAchievement = achievement
            withAnimation {
                isPresented = true
            }
        }, label: {
            ZStack {
                    Circle()
                        .foregroundStyle(Color.box.opacity(0.4))
               
                    Image(achievement.imageName!)
                        .resizable()
                        .scaledToFit()
                        .padding(.all)
                
            }.matchedGeometryEffect(id: achievement.id, in: animation)
                .opacity(selectedAchievement == nil || selectedAchievement!.id == achievement.id ? 1.0 : 0.0)
        })
        .buttonStyle(.plain)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Achievement.self, configurations: config)
   
    let preview = Achievement(title: "title1", subTitle: "subtitle1", desc: "You have shaked your can for 5 times a day!", completion: 33, isAchieved: true, imageName: "splashBlue")
    return AchievementButton(selectedAchievement: .constant(preview), achievement: preview, isPresented: .constant(false), animation: Namespace().wrappedValue)
}
