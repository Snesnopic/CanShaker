//
//  BadgeObtainedView.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 16/02/24.
//

import SwiftUI

struct BadgeObtainedView: View {
    @State var badge:Badge
    var body: some View {
        NavigationStack {
            Circle().foregroundStyle(badge.color).overlay(content: {
                VStack {
                    Image(systemName: "trophy")
                        .foregroundStyle(.black)
                        .font(.largeTitle)
                    Text("\(badge.name)!")
                        .foregroundStyle(.black)
                }
                
            })
            .navigationTitle("New badge!")
        }
    }
}

#Preview {
    BadgeObtainedView(badge: Badge(name: "Serial shaker", color: .indigo, description: "Masturbate 10 times in a day"))
}
