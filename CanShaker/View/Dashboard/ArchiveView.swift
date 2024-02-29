//
//  ArchiveView.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 29/02/24.
//

import SwiftUI
import SwiftData
import Charts
struct ArchiveView: View {
    @Query private var sessions:[Session]
    var body: some View {
        List{
            ForEach(dates(), id: \.self) { date in
                Section(header: Text(String(describing: date.relativeToNow))){
                    ForEach(sessions){ session in
                        if(session.date.formatted(.dateTime.day()) == date.formatted(.dateTime.day())){
                            Text("Sessione durata \(session.duration)")
                        }
                        
                    }
                }
                
            }
        }
        .listStyle(.plain)
    }
    
    
    
    
    func dates() -> [Date] {
        var dates: Set<Date> = []
        for session in sessions {
            if(!dates.contains(session.date)){
                dates.insert(session.date)
            }
            
        }
        
        let orderedDates = Array(dates.sorted(by: {$0 > $1}))
        return orderedDates
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
    for i in 0..<3{
        container.mainContext.insert(Session(date: Date(timeIntervalSinceNow: 0.0) + TimeInterval(i*2000000), accelData: accelD, duration: Double.random(in: (0.0)...(100.0)), heartRateData: heartRate))
        container.mainContext.insert(Session(date: Date(timeIntervalSince1970: 0.0) + TimeInterval(i*2000000), accelData: accelD, duration: 50.0/3.0, heartRateData: heartRate))
    }
    return ArchiveView()
        .modelContainer(container)
    
}
