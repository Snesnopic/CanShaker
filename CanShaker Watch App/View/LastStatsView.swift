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
    var body: some View {
        NavigationStack {
            if !sessions.isEmpty {
                Chart {
                    ForEach(sessions.last!.accelData.keys.sorted(),id: \.self) {
                        time in
                        BarMark (x:
    //                            .value("Time", time),
                            .value("Time", Date(timeIntervalSince1970: time),unit: .second),
                                 y: .value("Acceleration", sessions.last!.accelData[time]!.getTotalAcceleration()))
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
    //            .chartYAxisLabel("Speed")
    //            .chartLegend(content: {
    //                Text("Acceleration")
    //            })
                .chartForegroundStyleScale([
                    "Test": .blue
                ])
                .navigationTitle("Last session")

    
            }
            else {
                Text("No sessions yet!")
                    .navigationTitle("Last session")

            }
        }
    }
}
//
//#Preview {
//    for i in 0...100 {
//        MotionDataManager.shared.accelData[Double(i)] = CMAcceleration(x: Double.random(in: 0...3), y: Double.random(in: 0...3), z: Double.random(in: 0...3))
//    }
//    
//    return LastStatsView(motionDataManager: MotionDataManager.shared)
//}
