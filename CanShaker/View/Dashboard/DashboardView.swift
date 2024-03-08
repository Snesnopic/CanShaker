//
//  StatsView.swift
//  CanShaker
//
//  Created by Giuseppe Francione on 15/02/24.
//

import SwiftUI
import HealthKit
import Charts
import SwiftData
struct DashboardView: View {
    @Environment(\.modelContext) private var context
    @Query var achievements: [Achievement]
    @Query private var sessions: [Session]
    var body: some View {
        NavigationStack{

                VStack{
                    Info(sessions: sessions)
                        .padding(.bottom, 2)
                    HStack{
                        Text("Activity")
                            .bold()
                            .font(.title)
                        Spacer()
                        NavigationLink {
                            HistoryView(sessions: sessions)
                        } label: {
                            Text("See all")
                                
                        }
                    }
                    
                    LastSessionView(feedbackToGive: Feedback(sentence: "It looks like we have a marathon runner here!", type: .compliment, category: .speed, condition: .low, imageName: "bolt"),sessionToShow: sessions.last)
                        
                    Spacer()

                }
                .padding()
                
            .preferredColorScheme(.dark)
            .navigationTitle("Dashboard")
            .onAppear {
                Connectivity.shared.context = self.context
                Achievement.ensureAchievementsExist(context: context, achievements: achievements)
            }
            .frame(maxWidth: .infinity)
            .background{
                Color(Color("bgGray"))
            }
        }
    }
    
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Session.self,Achievement.self, configurations: config)
    
    let list = [
        Achievement(title: "Heroic Shaker", subTitle: "Master of Motion", desc: "You've shaken your can over 1000 times! Keep it up!", completion: 0, isAchieved: false, imageName: "splashBlue"),
        Achievement(title: "Steady Rhythm", subTitle: "No Moment of Pause", desc: "You've maintained a steady average speed for over 30 minutes!", completion: 0, isAchieved: false, imageName: "flameRed"),
        Achievement(title: "Race Against Time", subTitle: "Fast as the Wind", desc: "You've reached an average speed of over 15 km/h!", completion: 0, isAchieved: false, imageName: "flameRed"),
        Achievement(title: "Calm Heartbeat", subTitle: "State of Relaxation", desc: "You've maintained a heartbeat below 100 bpm throughout the entire session!", completion: 0, isAchieved: false, imageName: "splashBlue"),
        Achievement(title: "Persistence", subTitle: "Never Give Up!", desc: "You've used the app for more than 7 consecutive days!", completion: 7, isAchieved: false, imageName: "splashBlue"),
        Achievement(title: "Master of Energy", subTitle: "Heartbeats, Calories, Speed!", desc: "You've achieved a perfect score on all metrics: heartbeats, burned calories, and speed!", completion: 0, isAchieved: false, imageName: "flameRed")
    ]
    list.forEach { achievement in
        container.mainContext.insert(achievement)
    }
    
    var accelD:[TimeInterval:Double] = [:]
    var heartRate:[TimeInterval:Double] = [:]
    for i in 1...10 {
        accelD[Double(i)*0.3] = Double.random(in: 50...140)
        heartRate[Double(i)*0.3] = Double.random(in: 50...140)
    }
    
    container.mainContext.insert(Session(date: Date(), accelData: accelD, duration: 50.0/3.0, heartRateData: heartRate))
    return DashboardView()
        .modelContainer(container)
}
