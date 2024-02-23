//
//  LastStatsView.swift
//  CanShaker
//
//  Created by Giuseppe Francione on 16/02/24.
//

import SwiftUI
import Charts
import CoreMotion

struct LastStatsView: View {
    @ObservedObject var motionDataManager = MotionDataManager.shared
    var body: some View {
        NavigationStack {
            Chart {
                ForEach(motionDataManager.accelData.keys.sorted(),id: \.self) {
                    time in
                    BarMark (x: .value("Time",time),
                             y: .value("Acceleration", motionDataManager.getTotalAcceleration(accel: motionDataManager.accelData[time]!)))
                }
            }
            .chartLegend(content: {
                Text("Acceleration")
            })
            .chartForegroundStyleScale([
                "Test": .blue
            ])
            .navigationTitle("Last session")
        }
    }
}

#Preview {
    for i in 0...10 {
        MotionDataManager.shared.accelData[Double(i)] = CMAcceleration(x: Double.random(in: 0...3), y: Double.random(in: 0...3), z: Double.random(in: 0...3))
    }
    
   return LastStatsView(motionDataManager: MotionDataManager.shared)
}
