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
    
    @State var statToShow = 0
    var sessionToShow: Session?
    
    var body: some View {
        
        HStack(alignment: .center){
            Picker("", selection: $statToShow){
                Text("BPM")
                    .tag(0)
                Text("Speed")
                    .tag(1)
            }
            .pickerStyle(.segmented)
            .frame(minWidth: 150, idealWidth: 200, maxWidth: 250)
        }
        .padding(.vertical, 15)
        
        //TODO: adjust
        
        HStack{
            if sessionToShow == nil {
                Chart{
                    AreaMark (x: .value("Time", Date()),
                              y: .value("BPM", 40))
                    .foregroundStyle(Color.clear)
                    AreaMark (x: .value("Time", Date()),
                              y: .value("BPM", 160))
                }
                
                .chartYAxis {
                    AxisMarks(position: .leading) { _ in
                        AxisValueLabel()
                    }
                }
                
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
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Session.self, configurations: config)
    
    let calories = Double.random(in: (2.0)...(150.0))
    let duration = Double.random(in: 1...3600)
    var accelD:[TimeInterval:Double] = [:]
    var heartRate:[TimeInterval:Double] = [:]
    for i in 1...10 {
        accelD[Double(i)*0.3] = Double.random(in: 1...4)
        heartRate[Double(i)*0.3] = Double.random(in: 60...150)
    }
    let session = Session(date: Date(), accelData: accelD, duration: duration, heartRateData: heartRate, calories: calories)
    container.mainContext.insert(session)
    return AllGraphsView(sessionToShow: session)
        .modelContainer(container)
    
}
