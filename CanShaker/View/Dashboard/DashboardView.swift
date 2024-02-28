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
                        Text("Activity")
                            .bold()
                            .font(.title2)
                        Spacer()
                        Button {
                            //TODO: archive
//                            NavigationLink(destination: ArchiveView())
                        } label: {
                            Text("See all")
                                .foregroundStyle(.white)
                        }
                    }
                    InsultComplimentView()
                    //TODO: Adjust the view
                    LastSessionView()
                        .padding(.top, 5)
                    Spacer()

                }
                .padding()
                
            .preferredColorScheme(.dark)
            .navigationTitle("Dashboard")
        }
    }
    
}





#Preview {
    DashboardView()
}
