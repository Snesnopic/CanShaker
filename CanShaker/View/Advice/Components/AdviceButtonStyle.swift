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
        VStack{
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
                Image(backgroundImg)
                    .resizable()
                    .responsiveFrame(widthPercentage: 40, aspectRatio: (1,1))
            }
            .padding(.leading)
            .overlay {
                
                
                HStack {
                    Text(cDescription)
                        .lineLimit(1)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .padding()
                        .background {
                            UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 0, bottomLeading: 15, bottomTrailing: 15, topTrailing: 0))
                                .foregroundColor(Color.secondaryGray)
                        }
                    
                    
                }
                .padding(.top,110)
            }
        }
        
        
        .background {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color.secondaryGray)
                .shadow(radius: 20)
        }
    }
    
}


#Preview{
    AdviceButtonStyle(img: "book.closed.fill", category: "Methods", cDescription: "Lorem ipsum lorem ipsum lorem Lorem ipsum lorem ipsum lorem", backgroundImg: "safety")
        .preferredColorScheme(.dark)
    
}
