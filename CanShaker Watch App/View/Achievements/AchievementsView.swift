//
//  AchievementsView.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 16/02/24.
//

import SwiftUI

struct AchievementsView: View {
    @Namespace private var animation
    @State var isPresented:Bool = false
    @State var selectedAchievement:Achievement? = nil
    var body: some View {
        NavigationStack {
            if !isPresented {
                ScrollView {
                    Grid() {
                        ForEach(1...Achievement.list.count/3, id: \.self){
                            i in
                            GridRow {
                                Button(action: {
                                    selectedAchievement = Achievement.list[(i-1)*3]
                                    withAnimation {
                                        isPresented = true
                                    }
                                }, label: {
                                    ExtractedView(achievement: Achievement.list[(i-1)*3], animation: animation)
                                        .opacity(selectedAchievement == nil || selectedAchievement!.id == Achievement.list[(i-1)*3].id ? 1.0 : 0.0)
                                })
                                .buttonStyle(.plain)
                                Button(action: {
                                    selectedAchievement = Achievement.list[(i-1)*3 + 1]
                                    withAnimation {
                                        isPresented = true
                                    }
                                }, label: {
                                    
                                    ExtractedView(achievement: Achievement.list[(i-1)*3+1],animation: animation)
                                        .opacity(selectedAchievement == nil || selectedAchievement!.id == Achievement.list[(i-1)*3+1].id ? 1.0 : 0.0)
                                    
                                })
                                .buttonStyle(.plain)
                                Button(action: {
                                    selectedAchievement = Achievement.list[(i-1)*3+2]
                                    withAnimation {
                                        isPresented = true
                                    }
                                }, label: {
                                    
                                    ExtractedView(achievement: Achievement.list[(i-1)*3+2],animation: animation)
                                        .opacity(selectedAchievement == nil || selectedAchievement!.id == Achievement.list[(i-1)*3+2].id ? 1.0 : 0.0)
                                    
                                })
                                .buttonStyle(.plain)
                            }
                        }
                    }
                    .navigationTitle("Achievements")
                }
            }
            else {
                AchievementDetailView(animation: animation, isPresented: $isPresented, achievement: $selectedAchievement)
                    .scrollDisabled(true)
            }
        }
    }
}

#Preview {
    AchievementsView()
}

struct ExtractedView: View {
    var achievement:Achievement
    var animation:Namespace.ID
    var body: some View {
        Circle()
            .frame(width: 50)
            .matchedGeometryEffect(id: achievement.id, in: animation)
            .foregroundStyle(Color.random())
    }
}
