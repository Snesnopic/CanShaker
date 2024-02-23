//
//  StatsView.swift
//  CanShaker
//
//  Created by Giuseppe Francione on 15/02/24.
//

import SwiftUI
import HealthKit
import Charts

struct Dashboard: View {
    
    let hk: HKHealthStore = HKHealthStore()
//    @ObservedObject var motionDataManager = MotionDataManager.shared
    let workoutData: [(String, Double)] = [
        ("Time", 30.0),
        ("BPM", 120.0),
        ("Calories", 150.0)
    ]
    
    var body: some View {
        NavigationStack {
            Color(uiColor: UIColor.secondarySystemBackground).ignoresSafeArea().overlay {
                profileView
                ZStack{
                    lastSessionView
                    chartView
                    insultView
                }
            }
            .navigationTitle("Dashboard")
        }
    }
    
    var profileView: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.white)
                .frame(height: 100)
                .padding(.bottom, 550)
            HStack{
                //this is profile picture
                Circle()
                    .frame(width: 80, height: 80)
                VStack(alignment: .leading){
                    Text("Your streak:")
                        .font(.callout)
                        .fontWeight(.semibold)
                    Text("Week sessions:")
                        .font(.callout)
                        .fontWeight(.semibold)
                    Text("Achievements:")
                        .font(.callout)
                        .fontWeight(.semibold)
                }
                .padding()
            }
            .padding(.bottom, 550)
            .padding()
        }
        .padding()
    }
    
    var lastSessionView: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.white)
                .frame(height: 400)
                .padding(.top, 80)
            Text("Last session")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.bottom, 370)
            
        }
        .padding()
    }
    
    var chartView: some View {
        
        //TODO: If anyone wants to implement the data from the watch, remember that there needs to be a class that has the reference from the MotionDataManager, and that class (which will be a new file) has to have the watch and companion app as targets in the build, otherwise it won't work!
        //        ZStack {
        
        //            Chart {
        //                ForEach(motionDataManager.accelData.keys.sorted(),id: \.self) {
        //                    time in
        //                    BarMark (x: .value("Time",time),
        //                             y: .value("Acceleration", motionDataManager.accelData[time]!.x))
        //                }
        //            }
        ZStack() {
            
            HStack(spacing: 20) {
                ForEach(workoutData, id: \.0) { (label, value) in
                    VStack {
                        Text(label)
                            .font(.caption)
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 50, height: CGFloat(value))
                    }
                }
            }
            
            
            HStack(spacing: 70) {
                VStack (alignment: .leading){
                    Text("Placeholder: \(12)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text("Placeholder: \(120)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                VStack(alignment: .leading) {
                    Text("Placeholder: \(12)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text("Placeholder: \(120)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
            }
            .padding(.top, 270)
            .padding()
        }
    }
    
    var insultView: some View {
        
        //TODO: implement randomizing logic
        Text("random insult")
            .font(.title2)
            .fontWeight(.semibold)
            .padding(.top, 400)
    }
}

#Preview {
    Dashboard()
}
