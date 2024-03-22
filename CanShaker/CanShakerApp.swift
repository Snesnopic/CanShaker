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
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.unselectedTabBar)
    }
    var body: some Scene {
        WindowGroup {
            TabView(selection: $tabBarSelection) {
                DashboardView().tabItem {
                    Label("Dashboard", systemImage: "chart.bar")
                        .if(tabBarSelection != 0, transform: { view in
                            view.environment(\.symbolVariants, .none)
                        })
                    
                }
                .tag(0)
                AdviceView().tabItem {
                    Label("Advice", systemImage: "list.bullet.rectangle")
                        .if(tabBarSelection != 1, transform: { view in
                            view.environment(\.symbolVariants, .none)
                        })
                    
                }
                .tag(1)
                AchievementsView().tabItem {
                    Label("Achievements", systemImage: "trophy")
                        .if(tabBarSelection != 2, transform: { view in
                            view.environment(\.symbolVariants, .none)
                        })
                }
                .tag(2)
            }
        }
        .modelContainer(for: [Session.self,Achievement.self])
    }
}
