//
//  AchievementDetailView.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 20/02/24.
//

import SwiftUI

struct AchievementDetailView: View {
    var animation: Namespace.ID
    @Binding var achievement: Achievement?
    @Binding var isPresented:Bool
    var body: some View {
        VStack{
            if achievement != nil {
                Circle()
                    .frame(width: 300, height: 300)
                    .matchedGeometryEffect(id: achievement!.id, in: animation)
                    .foregroundStyle(.black)
                Text(achievement!.title)
                    .font(.title)
                    .matchedGeometryEffect(id: achievement!.title, in: animation)
                Text(achievement!.subTitle)
                    .font(.title2)
                    .matchedGeometryEffect(id: achievement!.subTitle, in: animation)
                Text(achievement!.description)
                    .font(.title3)
                    .matchedGeometryEffect(id: achievement!.description, in: animation)
//                Text("\(achievement!.completion)")
//                    .font(.headline)
//                    .matchedGeometryEffect(id: achievement!.completion, in: animation)
                Text("Date: \(achievement!.achievingDate != nil ? "\(achievement!.achievingDate!)" : "N/A")")
                    .font(.headline)
                    .matchedGeometryEffect(id: achievement!.achievingDate, in: animation)
            }
        }
        .onTapGesture {
            withAnimation {
                isPresented = false
            }
        }
    }
}

//#Preview {
//    AchievementDetailView(animation: Namespace.wrappedValue,achievement: Achievement(id: UUID(), badge: "", title: "title1", subTitle: "subtitle1", description: "You have shaked your can for 5 times a day!", completion: 33, isAchieved: true))
//}
