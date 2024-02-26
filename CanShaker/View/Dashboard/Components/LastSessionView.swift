//
//  LastSessionView.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 25/02/24.
//

import SwiftUI
import Charts
struct LastSessionView: View {
    @State private var statToShow = 0
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
                
                //CHART
                //TODO: filter based on data to sho
                HStack{
                    Chart{
                        ForEach(Session.list[0].bpmData){ data in
                            
                            AreaMark(x: .value("Time", data.time),
                                     y: .value("BPM", data.heartRate))
                            
                            .interpolationMethod(.catmullRom)
                            .foregroundStyle(heartGradient)
                            
                        }
                        
                    }
                    .chartXAxis{
                        AxisMarks(values: .automatic(desiredCount: 7)) { _ in
                            AxisValueLabel()
                        }
                    }
                    .chartYAxis {
                        AxisMarks(position: .leading) { _ in
                            AxisValueLabel()
                        }
                    }
                    .responsiveFrame(widthPercentage: 75, aspectRatio: (2,1))
                    .padding(.vertical)
                    
                    Spacer()
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
    LastSessionView()
}
