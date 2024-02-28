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
            ZStack{
                    LinearGradient(gradient: Gradient(colors: [.lightBP, .darkBP]), startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
        
                VStack{
                    UserInfo()
                    
                    HStack{
                        Text("Last Session")
                            .bold()
                            .font(.title)
                            .padding(.horizontal)
                        Spacer()
                    }
                    
                    //TODO: Adjust the view
                    LastSessionView()
                    Spacer()
                    
                }
                
            }
            .preferredColorScheme(.dark)
            .navigationTitle("Dashboard")
        }
    }
    
}





#Preview {
    DashboardView()
}
