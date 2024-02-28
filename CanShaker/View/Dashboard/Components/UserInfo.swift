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
            RoundedRectangle(cornerRadius: 15.0)
                .responsiveFrame(widthPercentage: 95, heightPercentage: 15)
                .foregroundStyle(Color("boxColor"))
                .opacity(0.4)
                .shadow(radius: 20)
            
            HStack{
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .opacity(0.3)
                    .responsiveFrame(widthPercentage: 18, aspectRatio: (1,1))
                VStack{
                    Text("**Streak**: 0") + Text("\n") +
                    Text("**Session this week**: 1") + Text("\n") +
                    Text("**Achievement complited**: 10/150")
                }
                .responsiveFrame(widthPercentage: 60)
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
