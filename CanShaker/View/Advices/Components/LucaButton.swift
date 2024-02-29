//
//  LucaButton.swift
//  CanShaker
//
//  Created by Davide Castaldi on 29/02/24.
//

import SwiftUI

struct LucaButton: View {
    var body: some View {
        ZStack {
            UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 0, bottomLeading: 20, bottomTrailing: 20, topTrailing: 0))
                .foregroundStyle(.blue)
            VStack(alignment: .leading) {
                    Text("Luca")
                        .font(.title3)
                ZStack(alignment: .leading) {
                    UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 0, bottomLeading: 20, bottomTrailing: 20, topTrailing: 0))
                        .foregroundStyle(.gray)
                        .responsiveFrame(widthPercentage: 95, heightPercentage: 5)
                    Text("Footer")
                        .font(.footnote)
                }
                
            }
            
        }
        .responsiveFrame(widthPercentage: 95, heightPercentage: 20)
    }
}

#Preview {
    LucaButton()
}
