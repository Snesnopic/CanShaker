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
    @State private var averageBpm = 0.0
    @State private var averageSpd = 0.0
    @State private var calories = 0
    @State private var time: String = "00"
    
    @Query private var sessions:[Session]
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15.0)
                .responsiveFrame(widthPercentage: 95, heightPercentage: 37)
                .foregroundStyle(.box)
                .opacity(0.4)
            
            VStack{
                
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
                    Spacer()
                }
                .padding(.vertical, 5)
                
                // CHART + STATS
                if !sessions.isEmpty {
                    HStack{
                        if(statToShow == 1){
                            SpeedGraphView()
                        }else{
                            BpmGraphView()
                        }
                        Spacer()
                        
                    }
                    
                    HStack{
                        //TODO: add and align text
                        VStack{
                            Text("**Average BPM:** ") + Text(String(format: "%.1f", averageBpm)) + Text("\n") +
                            Text("**Average speed:** ") + Text(String(format: "%.1f", averageSpd))
                        }
                        
                        Spacer()
                        VStack{
                            Text("**Calories:** ") + Text(String(calories)) +
                            Text("\n") +
                            Text("**Time:** ")  + Text(String(time))
                        }
                        Spacer()
                    }
                    .font(.caption)
                    .onAppear{
                        averageBpm = getAverage(dataset: sessions.last?.heartRateData.values)
                        averageSpd = getAverage(dataset: sessions.last?.accelData.values)
                        calories = Int(sessions.last!.calories)
                        time = doubleToTime(doubleNumber: &sessions.last!.duration)
                    }
                    
                }
                Spacer()
            }
            .responsiveFrame(widthPercentage: 85, heightPercentage: 35)
            
        }
        
        .preferredColorScheme(.dark)
    }
    
    func getAverage(dataset: Optional<Dictionary<Double, Double>.Values>) -> Double{
        var average = 0.0
        
        if(dataset?.isEmpty == false){
            var temp = 0.0
            for data in dataset! {
                average += data
                temp += 1
            }
            
            average = average/temp
        }
        
        return average
    }
    
}




//#Preview {
//    var accelData:[TimeInterval:Double] = [:]
//    var heartRate:[TimeInterval:Double] = [:]
//    for i in 1...10 {
//        heartRate[Double(i)*0.3] = Double.random(in: 50...140)
//        accelData[Double(i)*0.3] = Double.random(in: 1...6)
//    }
//
//    Connectivity.shared.sessions = [
//        Session(date: Date(), accelData: accelData, duration: 50.0/3.0, heartRateData: heartRate)
//    ]
//
//
//    return LastSessionView()
//}

//MARK: This is to make the preview work, the graph doesn't show for some reason but anyway the working stuff is right before these lines
#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Session.self, configurations: config)
    
    var accelData:[TimeInterval:Double] = [:]
    var heartRate:[TimeInterval:Double] = [:]
    for i in 1...10 {
        heartRate[Double(i)*0.3] = Double.random(in: 50...140)
        accelData[Double(i)*0.3] = Double.random(in: 1...6)
    }
    
    Connectivity.shared.sessions = [
        Session(date: Date(), accelData: accelData, duration: 50.0/3.0, heartRateData: heartRate)
    ]
    
    let preview = Connectivity.shared.sessions
    return LastSessionView()
        .modelContainer(container)
}
