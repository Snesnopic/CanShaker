//
//  LastSessionView.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 25/02/24.
//

import SwiftUI
import Charts
import CoreMotion
import SwiftData
struct LastSessionView: View {
    @State private var statToShow = 0
    @State var feedbackToGive: Feedback
    var sessionToShow:Session?
    
    init(sessionToShow: Session?) {
        self.feedbackToGive = Feedback(sentence: "ciao", type: .compliment, category: .accel, condition: .high, imageName: "bolt.fill")
        self.sessionToShow = sessionToShow
        UISegmentedControl.appearance().selectedSegmentTintColor = .unselectedTabBar
    }
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15.0)
                .responsiveFrame(widthPercentage: 95, heightPercentage: 50)
                .foregroundStyle(.box)
            
            VStack(alignment: .center) {
                FeedbackView(sessionToShow: sessionToShow!, feedbackToGive: feedbackToGive)
                // PICKER
                HStack{
                    Picker("", selection: $statToShow){
                        Text("BPM")
                            .tag(0)
                        Text("Speed")
                            .tag(1)
                    }
                    .responsiveFrame(widthPercentage: 35)
                    .pickerStyle(.segmented)
                }
                .padding(.vertical, 10)
                
                // CHART + STATS
                AllGraphsView(sessionToShow: sessionToShow!)
                
                HStack{
                    VStack (alignment: .leading){
                        Text("**Avg. BPM:** \(String(format: "%.1f", (sessionToShow?.getAverage(dataset: sessionToShow?.heartRateData.values) ?? "")))")
                        Spacer()
                        Text("**Avg. speed:** \(String(format: "%.1f", (sessionToShow?.getAverage(dataset: sessionToShow?.accelData.values) ?? ""))) m/s²")
                    }
                    Spacer()
                    VStack (alignment: .leading){
                        Text("**KCALs:** \(Int(sessionToShow?.calories ?? 0))")
                        Spacer()
                        Text("**Time:** ") + Text(sessionToShow?.duration.doubleToTime() ?? "0s")
                    }
                    Spacer()
                }
                .font(.subheadline)
                Spacer()
                
                
                
            }
            .responsiveFrame(widthPercentage: 85, heightPercentage: 35)
            
        }
        .preferredColorScheme(.dark)
    }
    
    
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Session.self, configurations: config)
    
    var calories = Double.random(in: (2.0)...(150.0))
    var duration = Double.random(in: 1...3600)
    var accelD:[TimeInterval:Double] = [:]
    var heartRate:[TimeInterval:Double] = [:]
    for i in 1...10 {
        accelD[Double(i)*0.3] = Double.random(in: 1...4)
        heartRate[Double(i)*0.3] = Double.random(in: 60...150)
    }
    var session = Session(date: Date(), accelData: accelD, duration: duration, heartRateData: heartRate, calories: calories)
    container.mainContext.insert(session)
    return LastSessionView(sessionToShow: session)
        .modelContainer(container)
}
