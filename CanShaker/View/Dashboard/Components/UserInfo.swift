//
//  UserInfo.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 25/02/24.
//

import SwiftUI

struct UserInfo: View {
    var body: some View {
        
        @State var sessions = Session()
        ZStack{
            RoundedRectangle(cornerRadius: 15.0)
                .responsiveFrame(widthPercentage: 95, heightPercentage: 15)
                .foregroundStyle(Color("boxColor"))
                .opacity(0.4)
                .shadow(radius: 20)
            
            HStack{
                VStack(alignment: .leading){
                    //TODO: This is subject to change with swift data
                    Text("2")
                    Text("**Session this week**: 1")
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
