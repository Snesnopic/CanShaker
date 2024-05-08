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
            VStack(spacing: 0){
                ForEach(Advice.list) { adv in
                    if(adv.category == advCategory){
                        NavigationLink {
                            AdviceDetailView(adv: adv)
                        } label: {
                            AdviceButtonStyle(category: adv.title, cDescription: adv.description, backgroundImg: "placeholder")
                                .foregroundStyle(.white)
                                .multilineTextAlignment(.leading)
                        }
                    }
                }
                Spacer()
            }
            .navigationTitle(advCategory.str)
            
        }
        
        
    }

}

#Preview {
    AdviceListView(advCategory: .hygiene)
}
