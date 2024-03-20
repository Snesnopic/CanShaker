//
//  AdviceButtonStyle.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 25/02/24.
//

import SwiftUI

struct AdviceButtonStyle: View {
    @State var img: String? = nil
    @State var category: String
    @State var cDescription: String
    @State var backgroundImg: String
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .responsiveFrame(widthPercentage: 95, heightPercentage: 20)
                .foregroundColor(Color.box)
                .shadow(radius: 20)
            
            HStack{
                Spacer()
                Image(backgroundImg)
                    .resizable()
                    .responsiveFrame(widthPercentage: 40, aspectRatio: (1,1))
                
            }
            .padding(.bottom, 10)
            
            VStack{
                Spacer()
                HStack{
                    //img might not exist in the advice list view
                    if let img {
                        Image(systemName: img)
                            .font(.title)
                    }
                    Text(category)
                        .bold()
                        .font(.title2)
                    Spacer()
                }
                .padding(.horizontal, 30)
                
                ZStack(alignment: .leading) {
                    
                    UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 0, bottomLeading: 15, bottomTrailing: 15, topTrailing: 0))
                        .responsiveFrame(widthPercentage: 95, heightPercentage: 6)
                        .foregroundColor(Color.boxDetail)
                        .shadow(radius: 20)
                    
                    Text(cDescription)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .padding(.horizontal)
                    
                }
            }
            .responsiveFrame(heightPercentage: 20)
            
            
        }
        .preferredColorScheme(.dark)
    }
}

#Preview{
    AdviceButtonStyle(img: "book.closed.fill", category: "Methods", cDescription: "Lorem ipsum lorem ipsum lorem", backgroundImg: "safety")
}
