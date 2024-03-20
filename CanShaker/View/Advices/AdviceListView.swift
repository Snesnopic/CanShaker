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
                        AdviceButtonStyle(category: adv.title, cDescription: String(adv.description.prefix(45) + "..."), backgroundImg: "placeholder")
                            .foregroundStyle(.white)
                            
                    })
                    .padding(.top)
                }
                Spacer()
            }
            
            .preferredColorScheme(.dark)
            .navigationTitle(advCategory.str)
            .frame(maxWidth: .infinity)
            .background{
                Color.bgGray
            }
            
        }
        
        
    }

}

#Preview {
    AdviceListView(advCategory: .hygiene)
}
