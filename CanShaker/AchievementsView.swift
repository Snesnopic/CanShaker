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
            Color(uiColor: UIColor.secondarySystemBackground).ignoresSafeArea().overlay {
                ScrollView {
                    VStack(alignment: .center) {
                        HStack {
                            Image(systemName: "diamond").font(.largeTitle)
                            VStack(alignment: .leading) {
                                Text("Monthly challenge").bold().font(.title2)
                                Text("Complete a session without using videos or images")
                            }
                        }
                        .padding(.all,20)
                        .background {
                            Color.white.clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        
                        HStack {
                            Image(systemName: "diamond.lefthalf.filled").font(.largeTitle)
                            VStack(alignment: .leading) {
                                Text("Daily challenge").bold().font(.title2)
                                Text("Complete a session without using videos or images")
                            }
                        }
                        .padding(.all,20)
                        .background {
                            Color.white.clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        
                        HStack {
                            Text("Achievements").font(.title).bold()
                            Spacer()
                        }
                        .padding()
                        HStack {
                            Image(systemName: "diamond.lefthalf.filled").font(.largeTitle)
                            VStack(alignment: .leading) {
                                Text("Last achievement").bold().font(.title2)
                                Text("Placeholder text placeholder text")
                            }
                        }
                        .padding(.all,20)
                        .background {
                            Color.white.clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        
                        Grid {
                            ForEach(1...3, id: \.self){ i in
                                GridRow {
                                    ForEach(1...3, id: \.self) {j in
                                        VStack {
                                            Circle().foregroundStyle(Color(
                                                red: .random(in: 0...1),
                                                green: .random(in: 0...1),
                                            blue: .random(in: 0...1)))
                                            Text("Achievement \(i*j)")
                                        }
                                    }.padding()
                                }
                            }
                        }
                        .background {
                            Color.white.clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        .padding(.all, 20)
                    }
                }
            }
            .navigationTitle("Challenges")
        }
    }
}

#Preview {
    AchievementsView()
}
