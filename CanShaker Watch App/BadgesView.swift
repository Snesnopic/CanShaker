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
    @State var selectedBadge:Badge = Badge(name: "", color: Color.white, description: "")
    var body: some View {
        NavigationStack {
            if !isPresented {
                ScrollView {
                    Grid() {
                        ForEach((1...allBadges.count/3), id: \.self){
                            i in
                            GridRow {
                                Button(action: {
                                    selectedBadge = allBadges[(i-1)*3]
                                    withAnimation {
                                        isPresented = true
                                    }
                                }, label: {
                                    ExtractedView(badge: allBadges[(i-1)*3], animation: animation)
                                })
                                .buttonStyle(.plain)
                                Button(action: {
                                    selectedBadge = allBadges[(i-1)*3 + 1]
                                    withAnimation {
                                        isPresented = true
                                    }
                                }, label: {
                                    ExtractedView(badge: allBadges[(i-1)*3 + 1],animation: animation)
                                    
                                })
                                .buttonStyle(.plain)
                                Button(action: {
                                    selectedBadge = allBadges[(i-1)*3 + 2]
                                    withAnimation {
                                        isPresented = true
                                    }
                                }, label: {
                                    ExtractedView(badge: allBadges[(i-1)*3 + 2],animation: animation)
                                    
                                })
                                .buttonStyle(.plain)
                            }
                        }
                    }
                    .onAppear(perform: {
                        print("Allbadges count: \(allBadges.count)")
                        print("Allbadges count/3: \(allBadges.count/3)")
                    })
                    
                    .navigationTitle("Badges")
                }
            }
            else {
                BadgeDetailView(animation: animation, isPresented: $isPresented, badge: selectedBadge)
            }
        }
    }
}

#Preview {
    BadgesView()
}

struct ExtractedView: View {
    var badge:Badge
    var animation:Namespace.ID
    var body: some View {
        Circle()
            .frame(width: 50)
            .matchedGeometryEffect(id: badge.id, in: animation)
            .foregroundStyle(badge.color)
    }
}
