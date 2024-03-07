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
    let dateFormatter = RelativeDateTimeFormatter()
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
    private var partitionedDates: [String: [Session]] = [:]
    init(sessions:[Session]) {
        dateFormatter.dateTimeStyle = .named
        var calendar = Calendar.current
        calendar.timeZone = .gmt
        dateFormatter.calendar = calendar
        self.sessions = sessions
        partitionedDates = self.sessions.reduce(into: [String: [Session]]()) { result, session in
            let relativeDate: String
            if Calendar.current.isDateInToday(session.date) {
                relativeDate = String(localized: "Today")
            } else if session.date.isSameDayAs(date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!) {
                print("Actual date: \(session.date)")
                relativeDate = String(localized: "Yesterday")
            } else {
                relativeDate = dateFormatter.localizedString(for: session.date, relativeTo: Calendar.current.date(byAdding: .day, value: +1, to: Date().zero)!)
                if relativeDate == "yesterday" {
                    print("error found: \(session.date) is marked as yesterday")
                }
            }
            
            if var sessionsForDate = result[relativeDate] {
                sessionsForDate.append(session)
                result[relativeDate] = sessionsForDate
            } else {
                result[relativeDate] = [session]
            }
        }
        
    }
    var body: some View {
        
            List{
                ForEach(partitionedDates.sorted(by: { pair1, pair2 in
                    return pair1.value.first!.date > pair2.value.first!.date
                }), id: \.key) {
                    header, partition in
                    Section {
                        ForEach(partition.sorted(by: { session1, session2 in
                            session1.date > session2.date
                        }), id: \.self) {
                            session in
                            HistoryElementStyle(session: session)
                            
                            
                        }
                        
                    } header:
                    {
                        Text(header)
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
