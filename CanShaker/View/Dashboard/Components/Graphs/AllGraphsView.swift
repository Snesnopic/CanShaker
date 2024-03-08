//
//  AllGraphsView.swift
//  CanShaker
//
//  Created by Davide Castaldi on 08/03/24.
//

import SwiftUI
import Charts
import SwiftData

struct AllGraphsView: View {
    
    @State private var statToShow = 0
    @State var sessionToShow: Session?
    
    var body: some View {
        
        HStack{
            if sessionToShow == nil {
                Chart{
                    AreaMark (x: .value("Time", Date()),
                              y: .value("BPM", 40))
                    .foregroundStyle(Color.clear)
                    AreaMark (x: .value("Time", Date()),
                              y: .value("BPM", 140))
                }
                .chartYAxis {
                    AxisMarks(position: .leading) { _ in
                        AxisValueLabel()
                    }
                }
                .responsiveFrame(widthPercentage: 80, aspectRatio: (2,1))
                .padding(.vertical)
                .overlay {
                    Text("No data yet!").bold()
                }
            }
            else {
                if(statToShow == 1) {
                    SpeedGraphView(session: sessionToShow!)
                } else {
                    BpmGraphView(session: sessionToShow!)
                }
            }
            Spacer()
        }
        //MARK: uncomment for debug if needed
//        .preferredColorScheme(.dark)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Session.self, configurations: config)
    
    var calories = Double.random(in: (2.0)...(150.0))
    var duration = Double.random(in: 1...3600)
    var accelD:[TimeInterval:Double] = [:]
    var heartRate:[TimeInterval:Double] = [:]
    for i in 1...10 {
        accelD[Double(i)*0.3] = Double.random(in: 1...4)
        heartRate[Double(i)*0.3] = Double.random(in: 60...150)
    }
    var session = Session(date: Date(), accelData: accelD, duration: duration, heartRateData: heartRate, calories: calories)
    container.mainContext.insert(session)
    return AllGraphsView(sessionToShow: session)
        .modelContainer(container)
    
}
