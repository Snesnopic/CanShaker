//
//  CanShakerApp.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 15/02/24.
//

import SwiftUI

@main
struct CanShaker_Watch_AppApp: App {
    @State var firstTabView:Int = 1
    @State var currentState:SessionState = .start
    var body: some Scene {
        WindowGroup {
            TabView(selection: $firstTabView,
                    content:  {
                SessionView(currentState: $currentState,firstTabView: $firstTabView)
                    .tabItem { Label(String(localized: "Session"), systemImage: "figure") }
                LastStatsView()
                    .tabItem { Label(String(localized: "Last session"), systemImage: "chart.bar.xaxis") }
                BadgesView()
                    .tabItem { Label(String(localized: "Badges"), systemImage: "trophy.fill") }
            })
            .tabViewStyle(.carousel)            
        }
    }
}
