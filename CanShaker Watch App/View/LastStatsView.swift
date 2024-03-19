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
    @Query(sort: \Session.date) var sessions:[Session]
    let connectivity = Connectivity.shared
    let heartGradient = LinearGradient(
        gradient: Gradient (
            colors: [ Color(.accent).opacity(0.75),
                      Color(.accent)
                .opacity(0.25),
                      Color.clear ]
        ),
        startPoint: .top, endPoint: .bottom)
    var body: some View {
        NavigationStack {
            if !sessions.isEmpty {
                Chart{
                    ForEach(sessions.last!.heartRateData.keys.sorted(),id: \.self){ time in
                        
                        AreaMark (x: .value("Time", Date(timeIntervalSince1970: time)),
                                  y: .value("BPM", (sessions.last!.heartRateData[time]!)))
                        
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(heartGradient)
                        
                    }
                    
                }
                .chartXAxis{
                    AxisMarks(values: .automatic(desiredCount: 3)) {
                        AxisValueLabel(format: Date.FormatStyle().minute(.defaultDigits).second(.defaultDigits))
                    }
                }
                .chartYAxis {
                    AxisMarks(position: .trailing) { _ in
                        AxisValueLabel()
                    }
                }
                .chartLegend(content: {
                    if !sessions.last!.heartRateData.isEmpty {
                        VStack (alignment: .leading){
                            Text("Range")
                                .foregroundStyle(.white)
                            HStack {
                                Text("\(Int(sessions.last!.heartRateData.values.min()!))-\(Int(sessions.last!.heartRateData.values.max()!))")
                                    .font(.title2)
                                    .foregroundStyle(.white)
                                HStack {
                                    Text("\(Int(sessions.last!.heartRateData.values.min()!))-\(Int(sessions.last!.heartRateData.values.max()!))")
                                        .font(.title2)
                                        .foregroundStyle(.white)
                                    Text("BPM")
                                        .foregroundStyle(.accent)
                                }
                                
                            }
                            
                        }
                    }
                })
                .chartForegroundStyleScale([
                    "Heart Rate": Color("heartColor")
                ])
                .navigationTitle("Last session")
                .padding(.trailing)
                
                
            }
            else {
                Text("No sessions yet!")
                    .navigationTitle("Last session")
                
            }
        }.onAppear {
            if !sessions.isEmpty {
                connectivity.sendCount()
                connectivity.send(sessions: sessions)
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Session.self, configurations: config)
   
    let session = Session(date: Date(), accelData: [:], duration: 10.0, heartRateData: [0.0:60.0,1.0:70.0,2.0:80.0], calories: 65)
    container.mainContext.insert(session)
    
    return LastStatsView()
        .modelContainer(container)
}
