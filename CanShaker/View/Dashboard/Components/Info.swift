//
//  Info.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 25/02/24.
//

import SwiftUI
import SwiftData

struct Info: View {
    var sessions: [Session]
    @Query var achievements: [Achievement]
    var body: some View {
        HStack{
            Spacer()
            VStack(alignment: .center, spacing: 10){
                Text(sessions.filter({ session in
                    return session.date.isSameWeek(as: Date())
                }).count.description)
                .font(.title)
                .fontWeight(.bold)
                
                Text("Sessions this week")
                    .font(.caption)
                
            }
            .padding(.horizontal,25)
            Spacer()
            //TODO: add line in the middle
            
            
            VStack(alignment: .center, spacing: 10){
                HStack(spacing: 0.0) {
                    Text(achievements.filter({ achievement in
                        return achievement.isAchieved
                    }).count.description)
                    Text("/")
                    Text("\(achievements.count)")
                }
                .font(.title)
                .fontWeight(.bold)
                
                Text("Achievements")
                    .font(.caption)
                
            }
            .padding(.horizontal, 25)
            Spacer()
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(Color.box)
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Session.self, Achievement.self, configurations: config)
    
    var accelD:[TimeInterval:Double] = [:]
    var heartRate:[TimeInterval:Double] = [:]
    for i in 1...10 {
        accelD[Double(i)*0.3] = Double.random(in: 50...140)
        heartRate[Double(i)*0.3] = Double.random(in: 50...140)
    }
    
    let sessions: [Session] = [Session(date: Date(), accelData: accelD, duration: 50.0/3.0, heartRateData: heartRate,calories: Double.random(in: (5.0)...(20.0)))]
    
    //MARK: change the name to use it if needed
    return Info(sessions: sessions)
        .modelContainer(container)
        .preferredColorScheme(.dark)
}
