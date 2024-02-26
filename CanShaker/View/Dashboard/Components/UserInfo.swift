//
//  UserInfo.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 25/02/24.
//

import SwiftUI

struct UserInfo: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25.0)
                .responsiveFrame(widthPercentage: 95, heightPercentage: 15)
                .foregroundStyle(Color("boxColor"))
                .opacity(0.2)
                .shadow(radius: 20)
            
            HStack{
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .opacity(0.3)
                    .responsiveFrame(widthPercentage: 18, aspectRatio: (1,1))
                VStack{
                    Text("Achievement complited: ").bold() + Text("10/150")
                    Text("Streak: ").bold() + Text("3")
                    Text("Session this week: ").bold() + Text("17")
                }
                .font(.callout)
                .multilineTextAlignment(.leading)
                Spacer()
            }
            
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserInfo()
}
