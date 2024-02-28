//
//  UserInfo.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 25/02/24.
//

import SwiftUI

struct Infos: View {
    var body: some View {
        HStack{
            ZStack{
                
                RoundedRectangle(cornerRadius: 15)
                    .responsiveFrame(widthPercentage: 45, heightPercentage: 10, alignment: .center)
                    .foregroundStyle(Color("boxColor"))
                    .opacity(0.4)
                VStack(alignment: .center, spacing: 10){
                    Text("Sessions this week")
                        .font(.headline)
                    //TODO: This is subject to change with swift data
                    Text("2")
                        .font(.title)
                        .fontWeight(.bold)
                }
            }
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .responsiveFrame(widthPercentage: 45, heightPercentage: 10, alignment: .center)
                    .foregroundStyle(Color("boxColor"))
                    .opacity(0.4)
                VStack(alignment: .center, spacing: 10){
                    Text("Achievements")
                        .font(.headline)
                    //TODO: This is subject to change with swift data
                    Text("1/25")
                        .font(.title)
                        .fontWeight(.bold)
                }
            }
        }
        .padding()
    }
}

#Preview {
    Infos()
}
