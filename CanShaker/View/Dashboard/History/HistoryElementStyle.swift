//
//  HistoryElementStyle.swift
//  CanShaker
//
//  Created by Davide Castaldi on 29/02/24.
//

import SwiftUI
import SwiftData

struct HistoryElementStyle: View {
    
    
    @State var session: Session
    
    var body: some View {
        HStack{
            VStack (alignment: .leading) {
                Text(session.date.formattedDayMonth + " - " + session.date.formattedHour)
                    .bold()
                    .font(.title2)
                Text("Duration: " + session.duration.doubleToTime())
                    .foregroundStyle(.secondary)
                    .font(.title3)
                
                
            }
            Spacer()
            Image(systemName: "info.circle")
                .font(.largeTitle)
                .foregroundStyle(.accent)
            
        }
        .padding()
        .padding(.vertical)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .shadow(radius: 15)
                .foregroundStyle(Color.secondaryGray)
        }
        .preferredColorScheme(.dark)
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
    
    container.mainContext.insert(Session(date: Date(), accelData: accelD, duration: 50.0/3.0, heartRateData: heartRate))
    return HistoryElementStyle(session: Session(date: Date(), accelData: accelD, duration: 50.0/3.0, heartRateData: heartRate))
        .modelContainer(container)
}
