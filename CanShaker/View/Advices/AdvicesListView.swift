//
//  AdvicesListView.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 25/02/24.
//

import SwiftUI

struct AdvicesListView: View {
    @State var advCategory: adviceCategory
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.lightBP, .darkBP]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                
                //TODO: filter list based on advCategory
                List{
                    ForEach(Advice.list){ adv in
                        if(adv.category == advCategory){
                            NavigationLink(destination: AdviceDetailView(adv: adv), label: {
                                VStack{
                                    Text(adv.title)
                                        .font(.title2)
                                        .bold() +
                                    Text("\n" + adv.description)
                                        .font(.headline)
                                }
                                .responsiveFrame(heightPercentage: 10)
                                
                            })
                            .listRowBackground(Color.clear)
                        }
                    }
                }
                .listStyle(.plain)
                
            }
            .preferredColorScheme(.dark)
            .navigationTitle(advCategory.str)
            
        }
        
        
    }
    
//    func adviceFilter(adv: adviceCategory) -> Advice {
//        if(adv == sel)
//    }
}

#Preview {
    AdvicesListView(advCategory: .hygiene)
}