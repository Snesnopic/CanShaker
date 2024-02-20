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
                
                //TODO: redo all the design :'c
                ScrollView {
                    VStack{
                        ForEach(Achievement.allAchievements){ achieve in
                            
                            NavigationLink(destination: AchievementDetailView(), label: {
                                
                                //TODO: every button should/could have the same size
                                ZStack{
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundStyle(.white)
                                    HStack{
                                        Image(systemName: "diamond")
                                            .padding(.horizontal, 4)
                                        
                                        VStack{
                                            Text(achieve.title)
                                                .font(.title3)
                                                
                                            +
                                            Text("\n" + achieve.subTitle)
                                                .font(.subheadline)
                                                .foregroundStyle(.gray)
                                        }
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .foregroundStyle(.gray)
                                            .padding(.horizontal, 10)
                                    }
                                    .foregroundStyle(.black)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: 380, alignment: .leading)
                                    
                                    //TODO: change these frames width with (device_width - (3~5% device_width))
                                }
                                .frame(width: 380)
                                
                            })
                            
                        }
                        
                        
                    }
                }
            }
            .navigationTitle("Achievements")
        }
    }
}

#Preview {
    AchievementsView()
}
