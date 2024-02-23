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
    @Binding var badge:Badge?
    var body: some View {
            VStack {
                if badge != nil {
                    Circle()
                        .matchedGeometryEffect(id: badge!.id, in: animation)
                        .foregroundStyle(badge!.color)
                    Text(badge!.description).multilineTextAlignment(.center)
                }
            }
            .navigationTitle(badge != nil ? badge!.name : "Badges")
        .onTapGesture {
            withAnimation {
                isPresented = false
                badge = nil
            }
        }
    }
}

#Preview {
    BadgeDetailView(animation: Namespace().wrappedValue, isPresented: .constant(true), badge: .constant(Badge(name: "Prova", color: Color.red, description: "Prova test prova ipsum color prova testum")))
}
