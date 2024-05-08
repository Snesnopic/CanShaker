//
//  AchievementDetailView.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 19/02/24.
//

import SwiftUI
import SwiftData

struct AchievementDetailView: View {
    var animation: Namespace.ID
    @Binding var isPresented:Bool
    @Binding var achievement:Achievement?
    var body: some View {
        VStack {
            if achievement != nil {
                ZStack {
                    Circle()
                        .foregroundStyle(Color.secondaryGray.opacity(0.4))
                    Image(achievement!.imageName)
                        .resizable()
                        .scaledToFit()
                        .padding(.all, 20)
                }
                .matchedGeometryEffect(id: achievement!.id, in: animation)
                Text(achievement!.desc).multilineTextAlignment(.center)
            }
        }
        .navigationTitle(achievement != nil ? achievement!.title : "Achievements")
        .onTapGesture {
            withAnimation(.linear(duration: 0.2)) {
                isPresented = false
            } completion: {
                withAnimation(.linear(duration: 0.2)){
                    achievement = nil
                }
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Achievement.self, configurations: config)
    
    let preview = Achievement(title: "title1", subTitle: "subtitle1", desc: "You have shaked your can for 5 times a day!", completion: 33, isAchieved: true, imageName: "splashBlue")
    return AchievementDetailView(animation: Namespace().wrappedValue, isPresented: .constant(true), achievement: .constant(preview))
        .modelContainer(container)
}
