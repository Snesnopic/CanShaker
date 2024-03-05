//
//  FeedbackView.swift
//  CanShaker
//
//  Created by Davide Castaldi on 28/02/24.
//

import SwiftUI

struct FeedbackView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .responsiveFrame(widthPercentage: 95, heightPercentage: 12)
                .foregroundStyle(Color("boxColor"))
                .opacity(0.4)
            //MARK: this is the max length of the insult/compliment (it's around 90 letters space considering lowercase letters)
            Text("You were so fast that Flash had to change job!")
                .responsiveFrame(widthPercentage: 93, heightPercentage: 10)
                .font(.title2)
                .multilineTextAlignment(.center)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    FeedbackView()
}
