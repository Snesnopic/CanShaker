//
//  CanShakerApp.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 15/02/24.
//

import SwiftUI

@main
struct CanShaker_Watch_AppApp: App {
    @State var firstTabView:Int = 0
    @State var currentState:SessionState = .start
    var body: some Scene {
        WindowGroup {
            if currentState == .shaking {
                TabView(selection: $firstTabView,
                        content:  {
                    SessionView(currentState: $currentState,firstTabView: $firstTabView)
                        .tabItem { Label("Session", systemImage: "figure") }
                        .tag(0)
                })
                .tabViewStyle(.page(indexDisplayMode: .never))
                .gesture(DragGesture())
            }
            else {
                TabView(selection: $firstTabView,
                        content:  {
                    SessionView(currentState: $currentState,firstTabView: $firstTabView)
                        .tabItem { Label("Session", systemImage: "figure") }
                        .tag(0)
                    LastStatsView()
                        .tabItem { Label("Last session", systemImage: "chart.bar.xaxis") }
                        .tag(1)
                    BadgesView()
                        .tabItem { Label("Badges", systemImage: "trophy.fill") }
                        .tag(2)
                })
                .tabViewStyle(.verticalPage)
            }
        }
    }
}
