//
//  BpmGraphView.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 26/02/24.
//

import SwiftUI
import Charts
import SwiftData

struct BpmGraphView: View {
    var session: Session
    let heartGradient = LinearGradient(
        gradient: Gradient (
            colors: [ Color(.accent).opacity(0.85),
                      Color(.accent)
                .opacity(0.3),
                      Color.clear ]
        ),
        startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        Spacer()
        VStack(alignment: .center){
            Chart{
                ForEach(session.heartRateData.keys.sorted(),id: \.self){ time in
                    
                    AreaMark (x: .value("Time", Date(timeIntervalSince1970: time)),
                              y: .value("BPM", (session.heartRateData[time]!)))
                    
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(heartGradient)
                    
                }
            //TODO: adjust 
            }
            .chartXAxis{
                AxisMarks(values: .automatic(desiredCount: 5)) {
                    AxisValueLabel(format: Date.FormatStyle().minute(.defaultDigits).second(.defaultDigits))
                }
            }
            .chartXAxisLabel("time", position: .overlay, alignment: .bottom).fontWeight(.bold)
            
            .chartYAxis {
                AxisMarks(position: .leading, values: .automatic(desiredCount: 10)) { _ in
                    AxisValueLabel()
                }
            }
            .chartYAxisLabel("BPM", position: .automatic, alignment: .leading).fontWeight(.bold)

        }
        .padding()
        .padding(.vertical, 15)
        .preferredColorScheme(.dark)
    }
    
}


#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Session.self, configurations: config)
    
    var heartRate:[TimeInterval:Double] = [:]
    for i in 1...100 {
        heartRate[Double(i)*0.3] = Double.random(in: 50...140)
    }
    let session = Session(date: Date(), duration: 50.0/3.0, heartRateData: heartRate)
    container.mainContext.insert(session)
    return BpmGraphView(session: session)
        .modelContainer(container)
}
