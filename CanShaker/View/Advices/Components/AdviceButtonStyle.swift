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
            RoundedRectangle(cornerRadius: 15)
                .responsiveFrame(widthPercentage: 95, heightPercentage: 30)
                .foregroundStyle(Color("boxColor"))
                .opacity(0.4)
                .shadow(radius: 20)
            //TODO: This will be the image ^
            RoundedRectangle(cornerRadius: 15)
                .responsiveFrame(widthPercentage: 95, heightPercentage: 8)
                .foregroundStyle(Color("boxColor"))
                .opacity(0.4)
                .shadow(radius: 20)
                .padding(.top, 190)
            VStack(alignment: .leading) {
                HStack{
                    Image(systemName: img)
                        .font(.largeTitle)
                    Text(category)
                        .bold()
                        .font(.title)
                }
                .padding(.bottom, 20)
                Text(cDescription)
            }
            .responsiveFrame(widthPercentage: 90, heightPercentage: 30, alignment: .bottomLeading)
            .padding(.bottom, 20)
            .foregroundStyle(.white)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview{
    AdviceButtonStyle(img: "book.closed.fill", category: "Methods", cDescription: "Lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum")
}
