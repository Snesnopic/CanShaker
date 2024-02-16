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
            List {
                Section(header: Text("Finish time")) {
                    Text("Graph")
                }
                Section(header: Text("About")) {
                    VStack (alignment: .leading) {
                        HStack {
                            Image(systemName: "heart.fill")
                            Text("Heart Rate")
                        }
                        .padding(.bottom)
                        Text("Lorem ipsum Dorem")
                    }
                }
            }
            .headerProminence(.increased)
            .navigationTitle(String(localized: "statistics"))
        }
    }
}

#Preview {
    StatsView()
}
