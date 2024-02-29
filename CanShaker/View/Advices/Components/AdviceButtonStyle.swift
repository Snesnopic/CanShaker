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
            
            //TODO: This will be the image ^
            
            VStack(alignment: .leading) {
                Spacer()
                HStack{
                    Image(systemName: img)
                        .font(.largeTitle)
                    Text(category)
                        .bold()
                        .font(.title)
                }
                Text(cDescription)
                    .font(.subheadline)
                    .fontWeight(.medium)
                ZStack(alignment: .leading) {
                    UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 0, bottomLeading: 20, bottomTrailing: 20, topTrailing: 0))
                        .responsiveFrame(widthPercentage: 95, heightPercentage: 5)
                        .foregroundColor(Color("boxColor"))
                        .opacity(0.4)
                        .shadow(radius: 20)

                    Text("Footer")
                        .font(.footnote)
                }
                
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview{
    AdviceButtonStyle(img: "book.closed.fill", category: "Methods", cDescription: "Lorem ipsum lorem ipsum lorem")
}
