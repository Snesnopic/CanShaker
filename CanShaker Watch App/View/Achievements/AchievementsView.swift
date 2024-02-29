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
    
    let columns = [
        GridItem(.fixed(50)),
        GridItem(.fixed(50)),
        GridItem(.fixed(50))
    ]
    
    var body: some View {
        NavigationStack {
            if !isPresented {
                    LazyVGrid(columns: columns){
                        ForEach(achievements, id: \.self ){ achievement in
                            AchievementButton(selectedAchievement: $selectedAchievement, achievement: achievement, isPresented: $isPresented, animation: animation)
                            
                        }
                    }
                    .navigationTitle("Achievements")
                    .onAppear {
                        Achievement.ensureAchievementsExist(context: context, achievements: achievements)
                    }
                    .scrollDisabled(false)
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

