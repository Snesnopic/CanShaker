//
//  LastStatsView.swift
//  CanShaker
//
//  Created by Giuseppe Francione on 16/02/24.
//

import SwiftUI
import Charts
import CoreMotion
import SwiftData

struct LastStatsView: View {
    @Query var sessions:[Session]
    let connectivity = Connectivity.shared
    var body: some View {
        NavigationStack {
            if !sessions.isEmpty {
                Chart {
                    ForEach(sessions.last!.accelData.keys.sorted(),id: \.self) {
                        time in
                        BarMark (x:
    //                            .value("Time", time),
                            .value("Time", Date(timeIntervalSince1970: time),unit: .second),
                                 y: .value("Acceleration", (sessions.last!.accelData[time]!)))
                    }
                }
                .chartXAxis{
                    AxisMarks(values: .automatic(desiredCount: 5)) {
                        AxisValueLabel(format: Date.FormatStyle().minute(.defaultDigits).second(.defaultDigits)).offset(x: -5)
                    }
                }
                .chartYAxis {
                    AxisMarks(values: .automatic(desiredCount: 5))
                }
                .chartXAxisLabel("Time")
                .chartYAxisLabel("Speed")
                .chartLegend(content: {
                    Text("Acceleration")
                })
                .chartForegroundStyleScale([
                    "Test": .blue
                ])
                .navigationTitle("Last session")

    
            }
            else {
                Text("No sessions yet!")
                    .navigationTitle("Last session")

            }
        }.onAppear {
            connectivity.send(sessions: sessions)
        }
    }
}

#Preview {
    LastStatsView()
}
