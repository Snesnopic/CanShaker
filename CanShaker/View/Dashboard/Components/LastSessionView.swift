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
    @State private var statToShow = 1
    var connectivity = Connectivity.shared
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25.0)
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
                
                // CHART
                HStack{
                    if !connectivity.sessions.isEmpty {
                        if(statToShow == 1){
                            SpeedGraphView()
                        }else{
                            BpmGraphView()
                        }
                        Spacer()
                    }
                }
                
                // STATS RESUMEE
                HStack{
                    //TODO: add text
                }
                
                Spacer()
            }
            .responsiveFrame(widthPercentage: 85, heightPercentage: 35)
            
        }
        .preferredColorScheme(.dark)
    }
}




#Preview {
    var accelData:[TimeInterval:Double] = [:]
    for i in 1...10 {
        accelData[Double(i)*0.3] = Double.random(in: 1...2)
    }
    Connectivity.shared.sessions = [
        Session(date: Date(), accelData: accelData, duration: 50.0/3.0)
    ]
    return LastSessionView()
}
