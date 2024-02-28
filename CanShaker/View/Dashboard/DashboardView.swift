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
    @Environment(\.modelContext) private var context
    
    var body: some View {
        
        NavigationStack{

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
                
            .preferredColorScheme(.dark)
            .navigationTitle("Dashboard")
            .onAppear {
                Connectivity.shared.context = self.context
            }
        }
    }
    
}





#Preview {
    DashboardView()
}
