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
            
            VStack{
                Spacer()
                HStack{
                    //img might not exist in the advice list view
                    if let img {
                        Image(systemName: img)
                            .font(.title)
                        Text(category)
                            .bold()
                            .font(.title2)
                    } else {
                        Text(category)
                            .bold()
                            .font(.title2)
                            .padding(.leading, -1)
                    }
                        
                    Spacer()
                }
                .padding(.leading)
                
                ZStack(alignment: .leading) {
                    UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 0, bottomLeading: 15, bottomTrailing: 15, topTrailing: 0))
                        .responsiveFrame(widthPercentage: 95, heightPercentage: 6)
                        .foregroundColor(Color.boxDetail)
                        .shadow(radius: 20)
                    
                    Text(cDescription.prefix(40) + "...")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .padding(.horizontal)
                }
            }
            
            .responsiveFrame(heightPercentage: 20)
        }
        .padding()
        .preferredColorScheme(.dark)
    }
}

#Preview{
    AdviceButtonStyle(img: "book.closed.fill", category: "Methods", cDescription: "Lorem ipsum lorem ipsum lorem Lorem ipsum lorem ipsum lorem", backgroundImg: "safety")
}
