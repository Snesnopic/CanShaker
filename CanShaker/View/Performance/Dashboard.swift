//
//  StatsView.swift
//  CanShaker
//
//  Created by Giuseppe Francione on 15/02/24.
//

import SwiftUI
import HealthKit
import Charts

struct Dashboard: View {
    let hk = HKHealthStore()
    @State var periodOfTime = 0
    var body: some View {
        NavigationStack {
            
            Color(uiColor: UIColor.secondarySystemBackground).ignoresSafeArea().overlay {
                profileView
                lastSessionView
            }
            .navigationTitle("Performance")
        }
    }
    
    var profileView: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.white)
                .frame(height: 100)
                .padding(.bottom, 550)
            HStack{
                //this is profile picture
                Circle()
                    .frame(width: 80, height: 80)
                VStack(alignment: .leading){
                    Text("Your streak:")
                        .font(.callout)
                        .fontWeight(.semibold)
                    Text("Week sessions:")
                        .font(.callout)
                        .fontWeight(.semibold)
                    Text("Achievements:")
                        .font(.callout)
                        .fontWeight(.semibold)
                }
                .padding()
            }
            
            .padding(.bottom, 550)
            .padding()
        }
        .padding()
    }
    
    var lastSessionView: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.white)
                .frame(height: 100)
            
            .padding(.bottom, 400)
        }
        .padding()
    }
}

#Preview {
    Dashboard()
}
