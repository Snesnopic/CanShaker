//
//  LastSessionView.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 25/02/24.
//

import SwiftUI
import Charts
import CoreMotion
struct LastSessionView: View {
    @State private var statToShow = 0
    @State private var averageBpm = 0.0
    @State private var averageSpd = 0.0
    @State private var calories = 0
    @State private var time: String = "00"
    
    var connectivity = Connectivity.shared
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15.0)
                .responsiveFrame(widthPercentage: 95, heightPercentage: 37)
                .foregroundStyle(.box)
                .opacity(0.3)
            
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
                if !connectivity.sessions.isEmpty {
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
                            Text("**Average BPM:** ") + Text(String(averageBpm)) + Text("\n") +
                            Text("**Average speed:** ") + Text(String(averageSpd))
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
                        averageBpm = getAverage(dataset: connectivity.sessions.last?.heartRateData.values)
                        averageSpd = getAverage(dataset: connectivity.sessions.last?.accelData.values)
                        calories = Int(connectivity.sessions.last!.calories)
                        time = doubleToTime(doubleNumber: &connectivity.sessions.last!.duration)
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
        
        return round(average)
    }
    
}




#Preview {
    var accelData:[TimeInterval:Double] = [:]
    var heartRate:[TimeInterval:Double] = [:]
    for i in 1...10 {
        heartRate[Double(i)*0.3] = Double.random(in: 1...2)
        accelData[Double(i)*0.3] = Double.random(in: 1...2)
    }
    
    Connectivity.shared.sessions = [
        Session(date: Date(), accelData: accelData, duration: 50.0/3.0, heartRateData: heartRate)
    ]
    
    
    return LastSessionView()
}
