//
//  LastStatsView.swift
//  CanShaker
//
//  Created by Giuseppe Francione on 16/02/24.
//

import SwiftUI
import Charts

struct LastStatsView: View {
    var body: some View {
        NavigationStack {
            Chart {
                BarMark(
                    x: .value("Shape Type", "a"),
                    y: .value("Total Count", 10)
                )
                BarMark(
                    x: .value("Shape Type", "b"),
                    y: .value("Total Count", 12)
                )
                BarMark(
                    x: .value("Shape Type", "c"),
                    y: .value("Total Count", 17)
                )
            }
            .chartLegend(content: {
                Text("Prova")
            })
            .chartForegroundStyleScale([
                "Test": .blue
            ])
            .navigationTitle("Last session")
        }
    }
}

#Preview {
    LastStatsView()
}
