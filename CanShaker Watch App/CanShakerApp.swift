//
//  CanShakerApp.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 15/02/24.
//

import SwiftUI

@main
struct CanShaker_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            TabView(selection: .constant(1),
                    content:  {
                ContentView().tag(1)
                Text("Tab Content 2").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 2")/*@END_MENU_TOKEN@*/ }.tag(2)
            })
        }
    }
}
