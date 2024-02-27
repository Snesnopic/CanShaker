//
//  BpmGraphView.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 26/02/24.
//

import SwiftUI
import Charts

struct BpmGraphView: View {
    var connectivity = Connectivity.shared
    let heartGradient = LinearGradient(
        gradient: Gradient (
            colors: [ Color("heartColor").opacity(0.75),
                      Color("heartColor")
                .opacity(0.25),
                      Color.clear ]
        ),
        startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        Chart{
            ForEach(connectivity.sessions.last!.heartRateData.keys.sorted(),id: \.self){ time in
                
                AreaMark (x: .value("Time", Date(timeIntervalSince1970: time)),
                          y: .value("BPM", (connectivity.sessions.last!.heartRateData[time]!)))
                
                .interpolationMethod(.catmullRom)
                .foregroundStyle(heartGradient)
                
            }
            
        }
        .chartXAxis{
            AxisMarks(values: .automatic(desiredCount: 7)) {
                AxisValueLabel(format: Date.FormatStyle().minute(.defaultDigits).second(.defaultDigits))
            }
        }
        .chartYAxis {
            AxisMarks(position: .leading) { _ in
                AxisValueLabel()
            }
        }
        .responsiveFrame(widthPercentage: 80, aspectRatio: (2,1))
        .padding(.vertical)
        
        
    }
}
#Preview {
    var heartRate:[TimeInterval:Double] = [:]
    for i in 1...10 {
        heartRate[Double(i)*0.3] = Double.random(in: 1...2)
    }
    Connectivity.shared.sessions = [
        Session(date: Date(), duration: 50.0/3, heartRateData: heartRate)
    ]
    return BpmGraphView()
}
