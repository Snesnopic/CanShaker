//
//  ContentView.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 15/02/24.
//

import SwiftUI
import HealthKit

struct ContentView: View {
    @State var healthStore:HKHealthStore?
    var body: some View {
        VStack {
            Button {
                if HKHealthStore.isHealthDataAvailable() {
                    print("ok")
                    healthStore = HKHealthStore()
                    
                }
                else {
                    print("not ok")
                }
            } label: {
                Text("Start")
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView(healthStore: nil)
}
