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
                                }
                                .responsiveFrame(heightPercentage: 10)
                                
                            })
                            .listRowBackground(Color.clear)
                        }
                    }
                }
                .listStyle(.plain)
                
            .preferredColorScheme(.dark)
            .navigationTitle(advCategory.str)
            .frame(maxWidth: .infinity)
            .background{
                Color(Color("bgGray"))
            }
            
        }
        
        
    }

}

#Preview {
    AdvicesListView(advCategory: .hygiene)
}
