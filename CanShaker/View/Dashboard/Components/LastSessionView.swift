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
    @Query private var sessions:[Session]
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15.0)
                .responsiveFrame(widthPercentage: 95, heightPercentage: 49)
                .foregroundStyle(.box)
                
            
            VStack(alignment: .center){
                
                // FEEDBACK
                Text("You were so fast that Flash had to change job!")
                    .responsiveFrame(widthPercentage: 93, heightPercentage: 10)
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .fontWeight(.semibold)
                    
                Line()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [6]))
                    .frame(height: 1)
                    .foregroundStyle(Color("boxColor"))
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
                    HStack{
                        if sessions.isEmpty {
                            Chart{
                                AreaMark (x: .value("Time", Date()),
                                          y: .value("BPM", 40))
                                .foregroundStyle(Color.clear)
                                AreaMark (x: .value("Time", Date()),
                                          y: .value("BPM", 140))
                            }
                            .chartYAxis {
                                AxisMarks(position: .leading) { _ in
                                    AxisValueLabel()
                                }
                            }
                            .responsiveFrame(widthPercentage: 80, aspectRatio: (2,1))
                            .padding(.vertical)
                            .overlay {
                                Text("No data yet!").bold()
                            }
                        }
                        else {
                            if(statToShow == 1){
                                SpeedGraphView(session: sessions.last!)
                            }else{
                                BpmGraphView(session: sessions.last!)
                            }
                        }
                        Spacer()
                        
                    }
                
                HStack{
                        VStack (alignment: .leading){
                            Text("**Avg. BPM:** \(String(format: "%.1f", getAverage(dataset: sessions.last?.heartRateData.values)))")
                            Spacer()
                            Text("**Avg. speed:** \(String(format: "%.1f", getAverage(dataset: sessions.last?.accelData.values))) m/s²")
                        }
                        Spacer()
                        VStack (alignment: .leading){
                            Text("**KCALs:** \(Int(sessions.last?.calories ?? 0))")
                            Spacer()
                            Text("**Time:** ") + Text(sessions.last?.duration.doubleToTime() ?? "0s")
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



#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Session.self, configurations: config)
    
    
    var accelD:[TimeInterval:Double] = [:]
    var heartRate:[TimeInterval:Double] = [:]
    for i in 1...10 {
        accelD[Double(i)*0.3] = Double.random(in: 50...140)
        heartRate[Double(i)*0.3] = Double.random(in: 50...140)
    }
    
    container.mainContext.insert(Session(date: Date(), accelData: accelD, duration: 50.0/3.0, heartRateData: heartRate,calories: Double.random(in: (5.0)...(20.0))))
    return LastSessionView()
        .modelContainer(container)
}
