//
//  AchievementDetailView.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 19/02/24.
//

import SwiftUI

struct AchievementDetailView: View {
    var animation: Namespace.ID
    @Binding var isPresented:Bool
    @Binding var achievement:Achievement?
    var body: some View {
            VStack {
                if achievement != nil {
                    Circle()
                        .matchedGeometryEffect(id: achievement!.id, in: animation)
                        .foregroundStyle(Color.random())
                    Text(achievement!.desc).multilineTextAlignment(.center)
                }
            }
            .navigationTitle(achievement != nil ? achievement!.title : "Achievements")
        .onTapGesture {
            withAnimation {
                isPresented = false
                achievement = nil
            }
        }
    }
}

#Preview {
    AchievementDetailView(animation: Namespace().wrappedValue, isPresented: .constant(true), achievement: .constant(Achievement.list.randomElement()))
}
