//
//  StatsView.swift
//  CanShaker
//
//  Created by Giuseppe Francione on 15/02/24.
//

import SwiftUI
import HealthKit
import Charts

struct StatsView: View {
    let hk = HKHealthStore()
    @State var periodOfTime = 0
    var body: some View {
        NavigationStack {
            Color.graffiti.ignoresSafeArea().overlay {
                    VStack {
                        Picker("What is your favorite color?", selection: $periodOfTime) {
                            Text("Daily").tag(0)
                            Text("Weekly").tag(1)
                            Text("Monthly").tag(2)
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading) {
                            Text("Last session").bold().font(.title2).padding()
                            Chart {
                                BarMark(
                                    x: .value("Shape Type", "a"),
                                    y: .value("Total Count", 10)
                                )
                                BarMark(
                                    x: .value("Shape Type", "b"),
                                    y: .value("Total Count", 12)
                                )
                                BarMark(
                                    x: .value("Shape Type", "c"),
                                    y: .value("Total Count", 17)
                                )
                            }
                            
                        }.background {
                            Color.white.ignoresSafeArea().clipShape(UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 25,topTrailing: 25)))
                        }
                    }
                    
                    
                    
                    
                }
            
            .navigationTitle("Performance")
        }
    }
}

#Preview {
    StatsView()
}
