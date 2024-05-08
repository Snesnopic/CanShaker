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
    
    var sessions: [Session]
    private var partitionedDates: [String: [Session]] = [:]
    init(sessions:[Session]) {
        dateFormatter.dateTimeStyle = .named
        let calendar = Calendar.current
        dateFormatter.calendar = calendar
        self.sessions = sessions
        partitionedDates = self.sessions.reduce(into: [String: [Session]]()) { result, session in
            var relativeDate: String
            if session.date.isSameDayAs(date: .now) {
                relativeDate = String(localized: "Today")
            } else if session.date.isSameDayAs(date: calendar.date(byAdding: .hour, value: -1, to: Date().zero)!) {
                relativeDate = String(localized: "Yesterday")
            } else {
                relativeDate = dateFormatter.localizedString(for: session.date, relativeTo: calendar.date(byAdding: .day, value: +1, to: Date().zero)!)
                if relativeDate == "yesterday" {
                    relativeDate = "2 days ago"
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
    @State private var showingSheet = false
    @State private var selectedSession: Session?
    private var screenHeight = UIWindow.current?.screen.bounds.height
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
                            .onTapGesture {
                                selectedSession = session
                                showingSheet = true
                            }
                    }
                } header:
                {
                    Text(header)
                }
            }
            
        }
        .sheet(item: $selectedSession, onDismiss: {
            showingSheet = false
        }, content: { session in
            LastSessionView(sessionToShow: session)
                .presentationDetents([.height(screenHeight!/1.8)])
                .presentationCornerRadius(15)
                .presentationDragIndicator(.visible)
                .presentationBackground(Color.secondaryGray)
        })
        .listStyle(.plain)
        .preferredColorScheme(.dark)
        .navigationTitle(String(localized: "History"))
        
    }
}

#Preview {
    
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Session.self, configurations: config)
    
    
    var sessions: [Session] = []
    for _ in 0..<100{
        let calories = Double.random(in: (2.0)...(150.0))
        let duration = Double.random(in: 1...3600)
        var accelD:[TimeInterval:Double] = [:]
        var heartRate:[TimeInterval:Double] = [:]
        for i in 1...10 {
            accelD[Double(i)*0.3] = Double.random(in: 1...4)
            heartRate[Double(i)*0.3] = Double.random(in: 60...150)
        }
        let session = Session(date: Date(), accelData: accelD, duration: duration, heartRateData: heartRate, calories: calories)
        sessions.append(session)
    }
        return HistoryView(sessions: sessions)
            .modelContainer(container)
}
