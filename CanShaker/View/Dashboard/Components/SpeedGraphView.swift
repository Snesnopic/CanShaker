//
//  SpeedGraphView.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 26/02/24.
//

import SwiftUI
import Charts
import CoreMotion

struct SpeedGraphView: View {
    var connectivity = Connectivity.shared
    let speedGradient = LinearGradient(
        gradient: Gradient (
            colors: [ Color("speedColor").opacity(0.75),
                      Color("speedColor")
                .opacity(0.25),
                      Color.clear ]
        ),
        startPoint: .top, endPoint: .bottom)
    
    var body: some View {
                    Chart{
                        ForEach(connectivity.sessions.last!.accelData.keys.sorted(),id: \.self){ time in
                            
                            AreaMark (x: .value("Time", Date(timeIntervalSince1970: time)),
                                      y: .value("Acceleration", (connectivity.sessions.last!.accelData[time]!)))
                            
                            .interpolationMethod(.catmullRom)
                            .foregroundStyle(speedGradient)
                            
                        }
                        
                    }
                    .chartXAxis{
                        AxisMarks(values: .automatic(desiredCount: 3)) {
                            AxisValueLabel(format: Date.FormatStyle().minute(.defaultDigits).second(.defaultDigits))
                        }
                    }
                    .chartYAxis {
                        AxisMarks(position: .leading) { _ in
                            AxisValueLabel()
                        }
                    }
                    .chartYScale(type: .power(exponent: 0.6))
                    .responsiveFrame(widthPercentage: 80, aspectRatio: (2,1))
                    .padding(.vertical)
   
    }
}

#Preview {
    var accelData:[TimeInterval:Double] = [:]
    for i in 1...50 {
        accelData[Double(i)*0.5] = Double.random(in: 1...2)
    }
    Connectivity.shared.sessions = [
        Session(date: Date(), accelData: accelData, duration: 50.0/3.0)
    ]
    return SpeedGraphView()
}
