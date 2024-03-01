//
//  StatsView.swift
//  CanShaker
//
//  Created by Giuseppe Francione on 15/02/24.
//

import SwiftUI
import HealthKit
import Charts
import SwiftData
struct DashboardView: View {
    @Environment(\.modelContext) private var context
    @Query var achievements: [Achievement]
    @Query private var sessions: [Session]
    var body: some View {
        NavigationStack{

                VStack{
                    Info(sessions: sessions)
                    HStack{
                        Text("Activity")
                            .bold()
                            .font(.title2)
                        Spacer()
                        NavigationLink {
                            HistoryView(sessions: sessions)
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
                Achievement.ensureAchievementsExist(context: context, achievements: achievements)
            }
        }
    }
    
}

#Preview {
    DashboardView()
}
