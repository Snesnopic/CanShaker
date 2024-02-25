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
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 370, height: 130)
                .foregroundStyle(Color("boxColor"))
                .opacity(0.2)
                .shadow(radius: 20)
            VStack{
                HStack{
                    Image(systemName: img)
                        .font(.largeTitle)
                    Text(category)
                        .bold()
                        .font(.title)
                }
                .frame(width: 350, alignment: .topLeading)
                .padding(.vertical, 1)
                Text(cDescription)
                    .frame(width: 350)
            }
            .frame(width: 350, height: 100, alignment: .topLeading)
            .multilineTextAlignment(.leading)
            .foregroundStyle(.white)
            
        }
        .preferredColorScheme(.dark)
    }
}


#Preview{
    AdviceButtonStyle(img: "book.closed.fill", category: "Methods", cDescription: "Lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum")
}
