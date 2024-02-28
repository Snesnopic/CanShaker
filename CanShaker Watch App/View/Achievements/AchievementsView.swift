//
//  AchievementsView.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 16/02/24.
//

import SwiftUI
import SwiftData

struct AchievementsView: View {
    @Namespace private var animation
    @State var isPresented:Bool = false
    @State var selectedAchievement:Achievement? = nil
    @Query var achievements:[Achievement]
    @Environment(\.modelContext) private var context
    var body: some View {
        NavigationStack {
            if !isPresented {
                ScrollView {
                    Grid() {
                        if !achievements.isEmpty {
                            ForEach(1...achievements.count/3, id: \.self){
                                i in
                                GridRow {
                                    Button(action: {
                                        selectedAchievement = achievements[(i-1)*3]
                                        withAnimation {
                                            isPresented = true
                                        }
                                    }, label: {
                                        ExtractedView(achievement: achievements[(i-1)*3], animation: animation)
                                            .opacity(selectedAchievement == nil || selectedAchievement!.id == achievements[(i-1)*3].id ? 1.0 : 0.0)
                                    })
                                    .buttonStyle(.plain)
                                    Button(action: {
                                        selectedAchievement = achievements[(i-1)*3 + 1]
                                        withAnimation {
                                            isPresented = true
                                        }
                                    }, label: {
                                        
                                        ExtractedView(achievement: achievements[(i-1)*3+1],animation: animation)
                                            .opacity(selectedAchievement == nil || selectedAchievement!.id == achievements[(i-1)*3+1].id ? 1.0 : 0.0)
                                        
                                    })
                                    .buttonStyle(.plain)
                                    Button(action: {
                                        selectedAchievement = achievements[(i-1)*3+2]
                                        withAnimation {
                                            isPresented = true
                                        }
                                    }, label: {
                                        
                                        ExtractedView(achievement: achievements[(i-1)*3+2],animation: animation)
                                            .opacity(selectedAchievement == nil || selectedAchievement!.id == achievements[(i-1)*3+2].id ? 1.0 : 0.0)
                                        
                                    })
                                    .buttonStyle(.plain)
                                }
                            }
                        }
                    }
                    .navigationTitle("Achievements")
                    .onAppear {
                        Achievement.ensureAchievementsExist(context: context, achievements: achievements)
                    }
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
