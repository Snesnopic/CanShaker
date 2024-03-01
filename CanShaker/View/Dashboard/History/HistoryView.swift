//
//  HistoryView.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 29/02/24.
//

import SwiftUI
import SwiftData
import Charts
struct HistoryView: View {
    var sessions: [Session]
    private var partitionedDates: [[Session]] = [[]]
    init(sessions:[Session]) {
        self.sessions = sessions
        let groups = sessions.reduce(into: [[Session]]()) { acc, session in
            for i in acc.indices {
                if acc[i][0].date.relativeToNow == session.date.relativeToNow {
                    acc[i].append(session)
                    return
                }
            }
            acc.append([session])
        }
        partitionedDates = groups
    }
    var body: some View {
        
        List{
            ForEach(partitionedDates.sorted(by: { array1, array2 in
                array1.first!.date > array2.first!.date
            }), id: \.self) {
                partition in
                Section {
                    ForEach(partition.sorted(by: { session1, session2 in
                        session1.date > session2.date
                    }), id: \.self) {
                        session in
                        HistoryElementStyle(session: session)
                    }
                } header:
                {
                    Text(partition.first!.date.relativeToNow)
                }
            }
        }
        .listStyle(.plain)
        .preferredColorScheme(.dark)
    }
    
}

#Preview {
    
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Session.self, configurations: config)
    
    var sessioni: [Session] = []
    var accelD:[TimeInterval:Double] = [:]
    var heartRate:[TimeInterval:Double] = [:]
    for i in 1...10 {
        accelD[Double(i)*0.3] = Double.random(in: 50...140)
        heartRate[Double(i)*0.3] = Double.random(in: 50...140)
    }
    for i in 0..<3{
        container.mainContext.insert(Session(date: Date(timeIntervalSinceNow: 0.0) + TimeInterval(i*2000000), accelData: accelD, duration: Double.random(in: (0.0)...(100.0)), heartRateData: heartRate))
        container.mainContext.insert(Session(date: Date(timeIntervalSince1970: 0.0) + TimeInterval(i*2000000), accelData: accelD, duration: 50.0/3.0, heartRateData: heartRate))
        sessioni.append(Session(date: Date(timeIntervalSinceNow: 0.0) + TimeInterval(i*2000000), accelData: accelD, duration: Double.random(in: (0.0)...(100.0)), heartRateData: heartRate))
    }
    
    return HistoryView(sessions: sessioni)
        .modelContainer(container)
    
}
