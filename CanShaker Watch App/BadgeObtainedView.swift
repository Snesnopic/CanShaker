//
//  BadgeObtainedView.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 16/02/24.
//

import SwiftUI

struct BadgeObtainedView: View {
    var body: some View {
        NavigationStack {
            Circle().foregroundStyle(.indigo).overlay(content: {
                VStack {
                    Image(systemName: "trophy").foregroundStyle(.black).font(.largeTitle)
                    Text("Serial shaker!").foregroundStyle(.black)
                }
                
            })
                .navigationTitle("New badge!")

        }
    }
}

#Preview {
    BadgeObtainedView()
}
