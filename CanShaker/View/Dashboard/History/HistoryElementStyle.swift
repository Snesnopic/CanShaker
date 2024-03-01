//
//  HistoryElementStyle.swift
//  CanShaker
//
//  Created by Davide Castaldi on 29/02/24.
//

import SwiftUI
import SwiftData

struct HistoryElementStyle: View {
    
    @State private var statToShow = 0
    @State private var averageBpm = 0.0
    @State private var averageSpd = 0.0
    @State private var calories = 0
    @State private var time: String = "00:03"
    
    @Query private var sessions: [Session]
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .responsiveFrame(widthPercentage: 95, heightPercentage: 15)
                .opacity(0.4)
                .foregroundStyle(Color("boxColor"))
            HStack{
                VStack(alignment: .center) {
                    Text("Duration")
                        .font(.title)
                        .fontWeight(.medium)
                    Text("\(time)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.accentColor, .black)
                }
                
                Spacer()
                
                Text("\(Date())")
                
            }
            .padding()
        }
        .padding()
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
    return HistoryElementStyle()
        .modelContainer(container)
}
