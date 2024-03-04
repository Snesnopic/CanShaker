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
    var body: some Scene {
        WindowGroup {
            AuthenticationView()
        }
        
    }
}
