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
                Grid {
                    ForEach(1...3, id: \.self){ i in
                        GridRow {
                            ForEach(1...3, id: \.self) {j in
                                Button(action: {
                                    withAnimation {
                                        isPresented = true
                                    }
                                }, label: {
                                    Circle()
                                        .matchedGeometryEffect(id: "circle\(i)\(j)", in: animation)
                                        .animation(.easeInOut)
                                        .foregroundStyle(.red)
                                    
                                })
                                .buttonStyle(.plain)
                            }
                        }
                    }
                }
                .navigationTitle("Badges")
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
