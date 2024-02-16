//
//  CanShakerApp.swift
//  CanShaker
//
//  Created by Giuseppe Francione on 15/02/24.
//

import SwiftUI

@main
struct CanShakerApp: App {
    var body: some Scene {
        WindowGroup {
            TabView(selection: .constant(1)) {
                StatsView().tabItem {
                    Label(String(localized: "Statistics"), systemImage: "chart.bar.xaxis")
                }
                AdvicesView().tabItem {
                    Label(String(localized: "Advices"), systemImage: "lightbulb.fill")
                }
                AchievementsView().tabItem {
                    Label(String(localized: "Achievements"), systemImage: "trophy")
                }
            }
        }
    }
}
