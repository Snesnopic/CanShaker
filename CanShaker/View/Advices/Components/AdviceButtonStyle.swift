//
//  AdviceButtonStyle.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 25/02/24.
//

import SwiftUI

struct AdviceButtonStyle: View {
    @State var img: String
    @State var category: String
    @State var cDescription: String
    @State var backgroundImg: String
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .responsiveFrame(widthPercentage: 95, heightPercentage: 20)
                .foregroundColor(Color("boxColor"))
                .opacity(0.4)
                .shadow(radius: 20)
            
            VStack(alignment: .leading) {
                Spacer()
                
                
                    HStack{
                        Image(systemName: img)
                            .font(.title)
                        Text(category)
                            .bold()
                            .font(.title2)
                    }
                    .padding(.horizontal)
                
                
                ZStack(alignment: .leading) {
                    UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 0, bottomLeading: 20, bottomTrailing: 20, topTrailing: 0))
                        .responsiveFrame(widthPercentage: 95, heightPercentage: 6)
                        .foregroundColor(Color("boxColor"))
                        .opacity(0.4)
                        .shadow(radius: 20)
                    
                    Text(cDescription)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .padding(.horizontal)
                        
                }
                
            }
            .responsiveFrame(widthPercentage: 92, heightPercentage: 20)
            
            HStack{
                Spacer()
                Image(backgroundImg)
                    .resizable()
                    .responsiveFrame(widthPercentage: 40, aspectRatio: (1,1))
                
            }
            .padding(.bottom, 10)
            
        }
        .preferredColorScheme(.dark)
    }
}

#Preview{
    AdviceButtonStyle(img: "book.closed.fill", category: "Methods", cDescription: "Lorem ipsum lorem ipsum lorem", backgroundImg: "safety")
}
