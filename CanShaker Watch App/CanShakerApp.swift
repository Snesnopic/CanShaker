//
//  CanShakerApp.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 15/02/24.
//

import SwiftUI
import SwiftData
@main
struct CanShaker_Watch_AppApp: App {
    @State var firstTabView:Int = 0
    @State var isShaking:Bool = false
    @Environment(\.modelContext) private var context

    var body: some Scene {
        WindowGroup {
            if isShaking {
                TabView(selection: $firstTabView,
                        content:  {
                    SessionView(firstTabView: $firstTabView, isShaking: $isShaking)
                        .tabItem { Label("Session", systemImage: "figure") }
                        .tag(0)
                })
                .tabViewStyle(.page(indexDisplayMode: .never))
                .gesture(DragGesture())
            }
            else {
                TabView(selection: $firstTabView,
                        content:  {
                    SessionView(firstTabView: $firstTabView, isShaking: $isShaking)
                        .tabItem { Label("Session", systemImage: "figure") }
                        .tag(0)
                    LastStatsView()
                        .tabItem { Label("Last session", systemImage: "chart.bar.xaxis") }
                        .tag(1)
                    AchievementsView()
                        .tabItem { Label("Achievements", systemImage: "trophy.fill") }
                        .tag(2)
                })
                .tabViewStyle(.verticalPage)
            }
        }
        .modelContainer(for: [Session.self, Achievement.self])
    }
}
