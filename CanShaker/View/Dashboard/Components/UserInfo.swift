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
                .frame(width: 370, height: 150)
                .foregroundStyle(Color("boxColor"))
                .opacity(0.2)
                .shadow(radius: 20)
            
            HStack{
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .opacity(0.3)
                    .frame(width: 90, height: 90)
                Spacer()
            }.frame(width: 330)
        }
    }
}

#Preview {
    UserInfo()
}
