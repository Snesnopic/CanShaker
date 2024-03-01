//
//  SpeedGraphView.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 26/02/24.
//

import SwiftUI
import Charts
import CoreMotion
import SwiftData

struct SpeedGraphView: View {
    var session:Session
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
                        ForEach(session.accelData.keys.sorted(),id: \.self){ time in
                            
                            AreaMark (x: .value("Time", Date(timeIntervalSince1970: time)),
                                      y: .value("Acceleration", (session.accelData[time]!)))
                            
                            .interpolationMethod(.catmullRom)
                            .foregroundStyle(speedGradient)
                            
                        }
                        
                    }
                    .chartXAxis{
                        AxisMarks(values: .automatic(desiredCount: 6)) {
                            AxisValueLabel(format: Date.FormatStyle().minute(.defaultDigits).second(.defaultDigits))
                        }
                    }
                    .chartYAxis {
                        AxisMarks(position: .leading) { _ in
                            AxisValueLabel()
                        }
                    }
                    .chartYAxisLabel("m/s²")
                    .chartYScale(type: .power(exponent: 0.6))
                    .responsiveFrame(widthPercentage: 80, aspectRatio: (2,1))
                    .padding(.vertical)
   
    }
}


#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Session.self, configurations: config)
    
    var accelD:[TimeInterval:Double] = [:]
    for i in 1...100 {
        accelD[Double(i)*0.3] = Double.random(in: 50...140)
    }
    let session = Session(date: Date(), accelData: accelD, duration: 50.0/3.0)
    container.mainContext.insert(session)
    return SpeedGraphView(session: session)
        .modelContainer(container)
}
