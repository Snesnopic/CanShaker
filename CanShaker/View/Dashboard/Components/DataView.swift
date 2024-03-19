//
//  DataView.swift
//  CanShaker
//
//  Created by Davide Castaldi on 08/03/24.
//

import SwiftUI

struct DataView: View {
    
    @State private var statToShow = 0
    @State var sessionToShow: Session?
    
    var body: some View {
        HStack{
            VStack (alignment: .leading){
                Text("**Avg. BPM:** \(String(format: "%.1f", (sessionToShow?.getAverage(dataset: sessionToShow?.heartRateData.values) ?? "")))")
                Spacer()
                Text("**Avg. speed:** \(String(format: "%.1f", (sessionToShow?.getAverage(dataset: sessionToShow?.accelData.values) ?? ""))) m/s²")
            }
            Spacer()
            VStack (alignment: .leading){
                Text("**Energy:** \(Int(sessionToShow?.calories ?? 0)) kcal")
                Spacer()
                Text("**Time:** ") + Text(sessionToShow?.duration.doubleToTime() ?? "0s")
            }
            Spacer()
        }
        .font(.subheadline)
    }
}

#Preview {
    DataView()
}
