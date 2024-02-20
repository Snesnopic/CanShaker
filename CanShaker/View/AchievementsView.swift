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
                        VStack(alignment: .leading) {
                            Text("Serial shaker").bold()
                            Text("5 times a day!").foregroundStyle(.secondary)
                        }
                        Spacer()
                        Text("Detail").foregroundStyle(.secondary)
                    }
                }

                NavigationLink {
                    
                } label: {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Top speed").bold()
                            Text("Shake at 140km/h").foregroundStyle(.secondary)
                        }
                        Spacer()
                        Text("Detail").foregroundStyle(.secondary)
                    }
                }
                
                NavigationLink {
                    
                } label: {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Slow and steady wins the race").bold()
                            Text("Finish a session in over 1 hour").foregroundStyle(.secondary)
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
