//
//  AchievementButton.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 29/02/24.
//

import SwiftUI

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
                    .foregroundStyle(Color.random())
                if achievement.imageName != nil {
                    Image(achievement.imageName!)
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                }
            }.matchedGeometryEffect(id: achievement.id, in: animation)
                .opacity(selectedAchievement == nil || selectedAchievement!.id == achievement.id ? 1.0 : 0.0)
        })
        .buttonStyle(.plain)
    }
}

//#Preview {
//    AchievementButton()
//}
