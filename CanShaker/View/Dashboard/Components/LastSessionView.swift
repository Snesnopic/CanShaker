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
    var sessionToShow:Session?
    
    init(sessionToShow: Session?) {
        self.sessionToShow = sessionToShow
        UISegmentedControl.appearance().selectedSegmentTintColor = .unselectedTabBar
    }
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15.0)
                .responsiveFrame(widthPercentage: 95, heightPercentage: 49)
                .foregroundStyle(.box)
            
            VStack(alignment: .center){
                
                //Feedback
                FeedbackView(sessionToShow: sessionToShow)
                //Graphs
                AllGraphsView(sessionToShow: sessionToShow)
                //Data showed on graphs
                DataView(sessionToShow: sessionToShow)
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
    
    let calories = Double.random(in: (1.0)...(150.0))
    let duration = Double.random(in: 1...1200)
    var accelD:[TimeInterval:Double] = [:]
    var heartRate:[TimeInterval:Double] = [:]
    for i in 1...10 {
        accelD[Double(i)*0.3] = Double.random(in: 1...4)
        heartRate[Double(i)*0.3] = Double.random(in: 60...150)
    }
    let session = Session(date: Date(), accelData: accelD, duration: duration, heartRateData: heartRate, calories: calories)
    container.mainContext.insert(session)
    return LastSessionView(sessionToShow: session)
        .modelContainer(container)
}
