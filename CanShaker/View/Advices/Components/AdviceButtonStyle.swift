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
            RoundedRectangle(cornerRadius: 15.0)
                .frame(height: 130)
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
                    Spacer()
                }
                .frame(alignment: .topLeading)
                
                Text(cDescription)
                    .frame(width: 350)
            }
            .frame(height: 100, alignment: .topLeading)
            .multilineTextAlignment(.leading)
            .foregroundStyle(.white)
            .padding(.horizontal)
        }
        .padding(.horizontal)
        .preferredColorScheme(.dark)
    }
}


#Preview{
    AdviceButtonStyle(img: "book.closed.fill", category: "Methods", cDescription: "Lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum")
}
