//
//  BadgeDetailView.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 19/02/24.
//

import SwiftUI

struct BadgeDetailView: View {
    var animation: Namespace.ID
    @Binding var isPresented:Bool
    var badge:Badge
    var body: some View {
        ScrollView {
            VStack {
                Circle()
                    .matchedGeometryEffect(id: "circle11", in: animation)
                    .animation(.easeIn, value: isPresented)
                    .foregroundStyle(badge.color).frame(width: 100)
                Text(badge.description).multilineTextAlignment(.center)
            }
            .navigationTitle(badge.name)
        }
        .onTapGesture {
            isPresented = false
        }
    }
}

#Preview {
    BadgeDetailView(animation: Namespace().wrappedValue, isPresented: .constant(true), badge: Badge(name: "Prova", color: Color.red, description: "Prova test prova ipsum color prova testum"))
}
