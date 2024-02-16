//
//  StatsView.swift
//  CanShaker
//
//  Created by Giuseppe Francione on 15/02/24.
//

import SwiftUI
import HealthKit

struct StatsView: View {
    let hk = HKHealthStore()
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
            .navigationTitle("Statistics")
        }
    }
}

#Preview {
    StatsView()
}
