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
    let modelContainer: ModelContainer
   
    init(){
       do{
           modelContainer = try ModelContainer(for: Achievement.self)
       } catch {
           fatalError()
       }
       
   }
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: .constant(1)) {
                DashboardView().tabItem {
                    Label("Dashboard", systemImage: "chart.bar.xaxis")
                }
                AdvicesView().tabItem {
                    Label("Advices", systemImage: "lightbulb.fill")
                }
                AchievementsView().tabItem {
                    Label("Achievements", systemImage: "trophy")
                }
            }
        }
        .modelContainer(modelContainer)
        .onChange(of: connectivity, {
            
        })
    }
}
