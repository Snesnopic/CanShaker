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
        
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .responsiveFrame(widthPercentage: 95, heightPercentage: 11, alignment: .center)
                .foregroundStyle(Color("boxColor"))
                
            HStack{
                VStack(alignment: .center, spacing: 10){
                    Text(sessions.filter({ session in
                        return session.date.isSameWeek(as: Date())
                    }).count.description)
                    .font(.title)
                    .fontWeight(.bold)
                    
                    Text("Sessions this week")
                        .font(.caption)
                    
                }
                .padding(.horizontal)
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
                
            }
            .responsiveFrame(widthPercentage: 85)
            //        HStack{
            //            ZStack{
            //                RoundedRectangle(cornerRadius: 15)
            //                    .responsiveFrame(widthPercentage: 45, heightPercentage: 10, alignment: .center)
            //                    .foregroundStyle(Color("boxColor"))
            //                    .opacity(0.4)
            //                VStack(alignment: .center, spacing: 10){
            //                    Text("Sessions this week")
            //                        .font(.headline)
            //                    Text(sessions.filter({ session in
            //                        return session.date.isSameWeek(as: Date())
            //                    }).count.description)
            //                        .font(.title)
            //                        .fontWeight(.bold)
            //                }
            //            }
            //            ZStack{
            //                RoundedRectangle(cornerRadius: 15)
            //                    .responsiveFrame(widthPercentage: 45, heightPercentage: 10, alignment: .center)
            //                    .foregroundStyle(Color("boxColor"))
            //                    .opacity(0.4)
            //                VStack(alignment: .center, spacing: 10){
            //                    Text("Achievements")
            //                        .font(.headline)
            //                    HStack(spacing: 0.0) {
            //                        Text(achievements.filter({ achievement in
            //                            return achievement.isAchieved
            //                        }).count.description)
            //                        Text("/")
            //                        Text("\(achievements.count)")
            //                    }
            //                    .font(.title)
            //                    .fontWeight(.bold)
            //                }
            //            }
            //        }
            //        .padding()
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
    
    var sessions: [Session] = [Session(date: Date(), accelData: accelD, duration: 50.0/3.0, heartRateData: heartRate,calories: Double.random(in: (5.0)...(20.0)))]
    var achievements: [Achievement] = [
        Achievement(title: "title1", subTitle: "subtitle1", desc: "You have shaked your can for 5 times a day!", completion: 33, isAchieved: true, imageName: "splashBlue"),
        Achievement(title: "title2", subTitle: "subtitle2", desc: "You have shaked your can really fast!", completion: 22, isAchieved: false, imageName: "flameRed"),
        Achievement(title: "title3", subTitle: "subtitle3", desc: "Something something", completion: 84, isAchieved: true, imageName: "splashBlue"),
        Achievement(title: "title4", subTitle: "subtitle4", desc: "Something something", completion: 77, isAchieved: false, imageName: "flameRed"),
        Achievement(title: "title5", subTitle: "subtitle5", desc: "Something something", completion: 99, isAchieved: false, imageName: "flameRed"),
        Achievement(title: "title6", subTitle: "subtitle6", desc: "Something something", completion: 77, isAchieved: false, imageName: "splashBlue"),
    ]
    return Info(sessions: sessions)
        .modelContainer(container)
}
