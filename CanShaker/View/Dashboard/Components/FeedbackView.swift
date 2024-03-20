//
//  FeedbackView.swift
//  CanShaker
//
//  Created by Davide Castaldi on 08/03/24.
//

import SwiftUI
import SwiftData

struct FeedbackView: View {
    
    @State var sessionToShow: Session?
    var body: some View {
        
        VStack(alignment: .leading){
            
            // FEEDBACK
            HStack{
                if sessionToShow == nil {
                    Image(systemName: "face.smiling")
                        .imageScale(.large)
                        .offset(x:-10)
                        .responsiveFrame(widthPercentage: 10)
                    Text("Hey there newcomer, start a session from the watch app to gain data!")
                    
                } else {
                    Image(systemName: "\(Feedback(session: sessionToShow!).imageName)")
                        .imageScale(.large)
                        .responsiveFrame(widthPercentage: 10)
                        
                    Text("\(Feedback(session: sessionToShow!).sentence)")
                        .offset(x: 5)
                    Spacer()
                }
            }
            .font(.title3)
            .multilineTextAlignment(.leading)
            .fontWeight(.semibold)
        }
        .responsiveFrame(widthPercentage: 90, heightPercentage: 10)
    
        Line()
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [6]))
            .frame(height: 1)
            .foregroundStyle(Color.unselectedTabBar)
            .responsiveFrame(widthPercentage: 90, heightPercentage: 1)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Session.self, configurations: config)
    
    let calories = Double.random(in: (2.0)...(150.0))
    let duration = Double.random(in: 1...3600)
    var accelD:[TimeInterval:Double] = [:]
    var heartRate:[TimeInterval:Double] = [:]
    for i in 1...10 {
        accelD[Double(i)*0.3] = Double.random(in: 1...4)
        heartRate[Double(i)*0.3] = Double.random(in: 60...150)
    }
    let session = Session(date: Date(), accelData: accelD, duration: duration, heartRateData: heartRate, calories: calories)
    container.mainContext.insert(session)
    
    
    return FeedbackView(sessionToShow: session)
        .modelContainer(container)
}

