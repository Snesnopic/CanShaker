//
//  AdvicesListView.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 25/02/24.
//

import SwiftUI

struct AdviceListView: View {
    @State var advCategory: adviceCategory
    
    var body: some View {
        NavigationStack{
            ForEach(Advice.list) { adv in
                if(adv.category == advCategory){
                    NavigationLink(destination: AdviceDetailView(adv: adv), label: {
                        AdviceButtonStyle(category: adv.title, cDescription: adv.description, backgroundImg: "placeholder")
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.leading)
                    })
                }
            }
            
            .padding()
            .preferredColorScheme(.dark)
            .navigationTitle(advCategory.str)
            .background{
                Color.bgGray
            }
            
        }
        
        
    }

}

#Preview {
    AdviceListView(advCategory: .hygiene)
}
