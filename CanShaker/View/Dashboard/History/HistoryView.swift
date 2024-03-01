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
    func containAnyTimeWord(_ string1: String, _ string2: String) -> Bool {
        let timeWords = ["hour", "minute", "second"]
        
        let containsWord1 = timeWords.contains { word in
            string1.lowercased().contains(word)
        }
        
        let containsWord2 = timeWords.contains { word in
            string2.lowercased().contains(word)
        }
        
        return containsWord1 && containsWord2
    }
    func containAnyTimeWord(_ string1: String) -> Bool {
        let timeWords = ["hour", "minute", "second"]
        
        return timeWords.contains { word in
            string1.lowercased().contains(word)
        }
    
    }
    var sessions: [Session]
    private var partitionedDates: [[Session]] = [[]]
    init(sessions:[Session]) {
        self.sessions = sessions
        partitionedDates = sessions.reduce(into: [[Session]]()) { acc, session in
            for i in acc.indices {
                if acc[i][0].date.relativeToNow == session.date.relativeToNow ||
                   containAnyTimeWord(acc[i][0].date.relativeToNow, session.date.relativeToNow)
                {
                    acc[i].append(session)
                    return
                }
            }
            acc.append([session])
        }

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
                    if partition.first!.date.isToday {
                        Text("Today")
                    }
                    else if Calendar.current.isDateInYesterday(partition.first!.date){
                        Text("Yesterday")
                    }
                    else {
                        Text(partition.first!.date.relativeToNow)
                    }
                }
            }
        }
        .navigationTitle("History")
        .listStyle(.plain)
        .preferredColorScheme(.dark)
        .navigationTitle("History")
        
    }
}

#Preview {
    
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Session.self, configurations: config)

    
    var accelD:[TimeInterval:Double] = [:]
    var heartRate:[TimeInterval:Double] = [:]
    for i in 1...10 {
        accelD[Double(i)*0.3] = Double.random(in: 50...140)
        heartRate[Double(i)*0.3] = Double.random(in: 50...140)
    }
    for i in 0..<100{
        container.mainContext.insert(Session(date: Date(timeIntervalSinceNow: 0.0) - TimeInterval(Double(i)*Double.random(in: (0.0)...(10000.0))), accelData: accelD, duration: Double.random(in: 30.0...6000.0), heartRateData: heartRate))
        container.mainContext.insert(Session(date: Date(timeIntervalSinceNow: 0.0) - TimeInterval(Double(i)*Double.random(in: (0.0)...(10000.0))), accelData: accelD, duration: Double.random(in: 30.0...6000.0), heartRateData: heartRate))
    }
    do {
        return try HistoryView(sessions: container.mainContext.fetch(FetchDescriptor<Session>()))
            .modelContainer(container)
    }
    catch {
        return Text("Preview error")
    }
    
}
