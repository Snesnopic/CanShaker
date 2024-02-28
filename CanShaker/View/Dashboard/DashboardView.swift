//
//  StatsView.swift
//  CanShaker
//
//  Created by Giuseppe Francione on 15/02/24.
//

import SwiftUI
import HealthKit
import Charts

struct DashboardView: View {
    var body: some View {
        NavigationStack{

                VStack{
                    Infos()
                    HStack{
                        Text("Last Session")
                            .bold()
                            .font(.title2)
                            .padding(.horizontal)
                        Spacer()
                    }
                    //TODO: Adjust the view
                    LastSessionView()
                    Spacer()
                    
                }
                
            .preferredColorScheme(.dark)
            .navigationTitle("Dashboard")
        }
    }
    
}





#Preview {
    DashboardView()
}
