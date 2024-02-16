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
                    VStack {
                    Image(systemName: "chart.bar.xaxis")
                    Text("Statistics")
                }}
                SharingView().tabItem {
                    VStack {
                        Image(systemName: "person.2.fill")
                        Text("Sharing")
                }}
                AdvicesView().tabItem {
                    VStack {
                        Image(systemName: "lightbulb.fill")
                        Text("Advices")
                }}
                
                AchievementsView().tabItem {
                    VStack {
                        Image(systemName: "trophy")
                        Text("Achievements")
                }}
                
                

            }
        }
    }
}
