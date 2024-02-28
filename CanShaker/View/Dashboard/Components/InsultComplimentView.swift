//
//  InsultComplimentView.swift
//  CanShaker
//
//  Created by Davide Castaldi on 28/02/24.
//

import SwiftUI

struct InsultComplimentView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .responsiveFrame(widthPercentage: 95, heightPercentage: 15)
                .foregroundStyle(Color("boxColor"))
                .opacity(0.4)
            VStack(alignment: .center){
                Text("Wow you outperformed Ascanio")
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    InsultComplimentView()
}
