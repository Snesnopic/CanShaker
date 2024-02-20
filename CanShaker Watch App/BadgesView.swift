//
//  BadgesView.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 16/02/24.
//

import SwiftUI

struct BadgesView: View {
    @Namespace private var animation
    @State var isPresented:Bool = false
    var body: some View {
        NavigationStack {
            if !isPresented {
                ScrollView {
                    GridLayout() {
                        ForEach(allBadges, id: \.id) { badge in
                            Button(action: {
                                withAnimation {
                                    isPresented = true
                                }
                            }, label: {
                                Circle()
                                    .frame(width: 20)
                                    .matchedGeometryEffect(id: badge.id, in: animation)
                                    .foregroundStyle(.red)
                                
                            })
                            .buttonStyle(.plain)
                        }
                    }
                    
                    .navigationTitle("Badges")
                }
            }
            else {
                BadgeDetailView(animation: animation, isPresented: $isPresented, badge: Badge(name: "Prova", color: Color.red, description: "Prova test prova ipsum color prova testum"))
            }
        }
    }
}

#Preview {
    BadgesView()
}
