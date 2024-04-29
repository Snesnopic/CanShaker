//
//  AdviceDetailView.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 25/02/24.
//

import SwiftUI

struct AdviceDetailView: View {
    @State var adv: Advice
    var body: some View {
        
        ZStack(alignment: .top){
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(Color.boxDetail)
                .padding()
            
            VStack(alignment: .leading) {
                //MARK: this is the image
                Group {
                    UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 15, bottomLeading: 0, bottomTrailing: 0, topTrailing: 15))
                        .frame(maxHeight: 220)
                    
                }
                VStack(alignment: .leading, spacing: 15) {
                    Text(adv.title)
                        .font(.title)
                        .fontWeight(.bold)
                    Image(systemName: "hands.and.sparkles.fill")
                        .imageScale(.large)
                    
                    Text(adv.description)
                }
                .padding()
                Spacer()
            }
            .padding()
            .foregroundStyle(.white)
            Spacer()
            
        }
        .padding()
        .preferredColorScheme(.dark)
        .navigationTitle(adv.title)
        .background{
            Color.bgGray
        }
    }
}


#Preview {
    AdviceDetailView(adv: Advice(title: "Test", description: "Lorem tunz tunz tunz", category: .hygiene))
}
