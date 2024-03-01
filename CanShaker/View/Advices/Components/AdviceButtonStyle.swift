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
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 14)
                .responsiveFrame(widthPercentage: 95, heightPercentage: 14)
                .foregroundColor(Color("boxColor"))
                .opacity(0.4)
                .shadow(radius: 20)
            Spacer()
            VStack(alignment: .leading) {
                HStack{
                    Image(systemName: img)
                        .font(.largeTitle)
                    Text(category)
                        .bold()
                        .font(.title)
                }
                .padding()
                ZStack(alignment: .leading) {
                    UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 0, bottomLeading: 20, bottomTrailing: 20, topTrailing: 0))
                        .responsiveFrame(widthPercentage: 95, heightPercentage: 5)
                        .foregroundColor(Color("boxColor"))
                        .opacity(0.4)
                        .shadow(radius: 20)
                    Text(cDescription)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .padding()
                }
                
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview{
    AdviceButtonStyle(img: "book.closed.fill", category: "Methods", cDescription: "Lorem ipsum lorem ipsum lorem")
}
