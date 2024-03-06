//
//  CanShakerApp.swift
//  CanShaker
//
//  Created by Giuseppe Francione on 15/02/24.
//

import SwiftUI
import SwiftData

@main
struct CanShakerApp: App {
    var connectivity = Connectivity.shared
    @State private var tabBarSelection:Int = 0
    var body: some Scene {
        WindowGroup {
            TabView(selection: $tabBarSelection) {
                DashboardView().tabItem {
                    Label("Dashboard", systemImage: "chart.bar.fill")
                    
                }
                .tag(0)
                AdvicesView().tabItem {
                    Label("Advice", systemImage: "list.bullet.rectangle")
                }
                .tag(1)
                AchievementsView().tabItem {
                    Label("Achievements", systemImage: "trophy")
                }
                .tag(2)
            }
            .modelContainer(for: [Session.self,Achievement.self])
        }
        
    }
}
