//
//  LastSessionView.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 25/02/24.
//

import SwiftUI
import Charts
struct LastSessionView: View {
    let heartGradient = LinearGradient(
                 gradient: Gradient (
                     colors: [ Color("heartColor").opacity(0.75),
                               Color("heartColor")
                        .opacity(0.25),
                               Color.clear ]
                ),
                startPoint: .top, endPoint: .bottom)
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25.0)
                .frame(height: 400)
                .padding(.horizontal)
                .foregroundStyle(.box)
                .opacity(0.3)
            VStack{
                Chart{
                    ForEach(Session.list[0].bpmData){ data in
                        AreaMark(x: .value("Time", data.time),
                                 y: .value("BPM", data.heartRate))
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(heartGradient)
                        
                    }
                    
                }
                .chartXAxis(.hidden)
                .chartYAxis(.hidden)
                .frame(height: 250)
                .padding(.horizontal)
                
                //TODO: add text
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    LastSessionView()
}
