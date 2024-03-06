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
        
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .responsiveFrame(widthPercentage: 95, heightPercentage: 13)
                .shadow(radius: 15)
                .foregroundStyle(Color("boxColor"))
                .overlay{
                    HStack{
                        VStack{
                            Text(session.date.formattedDayMonth)
                                .bold()
                                .font(.title2) +
                            Text("\nDuration: " + session.duration.doubleToTime())
                                .foregroundStyle(Color("boxColor"))
                                .font(.title3)
                            Spacer()
                        }
                        Spacer()
                        
                        
                    }
                    .padding()
                }
                .overlay{
                    VStack{
                        Spacer()
                        HStack{
                            Spacer()
                            Text(session.date.formattedHour)
                                .foregroundStyle(Color("boxColor"))
                                .font(.title3)
                        }
                        .padding()
                    }
                }
            
        }
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
