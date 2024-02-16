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
                ForEach(1...3, id: \.self){ Int in
                    GridRow {
                        ForEach(1...3, id: \.self) {_ in 
                            Circle().foregroundStyle(Color(
                                red: .random(in: 0...1),
                                green: .random(in: 0...1),
                                blue: .random(in: 0...1)))
                        }.padding()
                    }
                }
            }
            
           
            .navigationTitle("Badges")
        }
    }
}

#Preview {
    BadgesView()
}
