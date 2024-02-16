//
//  BadgesView.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 16/02/24.
//

import SwiftUI

struct BadgesView: View {
    var body: some View {
        NavigationStack {
            Grid {
                GridRow {
                    Circle()
                    Circle()
                    Circle()
                }.padding()
                GridRow {
                    Circle()
                    Circle()
                    Circle()
                }
                .padding()
                GridRow {
                    Circle()
                    Circle()
                    Circle()
                }
                .padding()
            }
            .navigationTitle("Badges")
        }
    }
}

#Preview {
    BadgesView()
}
