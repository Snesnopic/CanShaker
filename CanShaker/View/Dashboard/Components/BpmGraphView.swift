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
    @Query private var sessions:[Session]
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
            ForEach(sessions.last!.heartRateData.keys.sorted(),id: \.self){ time in
                
                AreaMark (x: .value("Time", Date(timeIntervalSince1970: time)),
                          y: .value("BPM", (sessions.last!.heartRateData[time]!)))
                
                .interpolationMethod(.catmullRom)
                .foregroundStyle(heartGradient)
                
            }
            
        }
        .chartXAxis{
            AxisMarks(values: .automatic(desiredCount: 4)) {
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
//#Preview {
//    var heartRate:[TimeInterval:Double] = [:]
//    for i in 1...50 {
//        heartRate[Double(i)*1] = Double.random(in: 50...140)
//    }
//    Connectivity.shared.sessions = [
//        Session(date: Date(), duration: 50.0/3, heartRateData: heartRate)
//    ]
//    return BpmGraphView()
//}

//MARK: This is to make the preview work, the graph doesn't show for some reason but anyway the working stuff is right before these lines
#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Session.self, configurations: config)
    
    var heartRate:[TimeInterval:Double] = [:]
    for i in 1...50 {
        heartRate[Double(i)*1] = Double.random(in: 50...140)
    }
    Connectivity.shared.sessions = [
        Session(date: Date(), duration: 50.0/3, heartRateData: heartRate)
    ]
    
    let preview = Connectivity.shared.sessions
    return LastSessionView()
        .modelContainer(container)
}
