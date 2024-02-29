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
                    Info()
                    HStack{
                        Text("Activity")
                            .bold()
                            .font(.title2)
                        Spacer()
                        NavigationLink {
                            ArchiveView()
                        } label: {
                            Text("See all")
                                
                        }
                    }
                    FeedbackView()
                    //TODO: Adjust the view
                    LastSessionView()
                        .padding(.top, 5)
                    Spacer()

                }
                .padding()
                
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
