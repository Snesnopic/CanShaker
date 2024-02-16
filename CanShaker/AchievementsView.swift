//
//  AchievementsView.swift
//  CanShaker
//
//  Created by Giuseppe Francione on 16/02/24.
//

import SwiftUI

struct AchievementsView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    
                } label: {
                    HStack {
                        VStack {
                            Text("Serial shaker!").bold()
                            Text("5 times a day!").foregroundStyle(.secondary)
                        }
                        Spacer()
                        Text("Detail").foregroundStyle(.secondary)
                    }
                }

            }
            .listStyle(.grouped)
            .navigationTitle("Achievements")
        }
    }
}

#Preview {
    AchievementsView()
}
