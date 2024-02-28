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
                    .frame(width: 180, height: 100)
                    .foregroundStyle(Color("boxColor"))
                    .opacity(0.4)
                VStack(alignment: .center, spacing: 15){
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
                    .frame(width: 180, height: 100)
                    .foregroundStyle(Color("boxColor"))
                    .opacity(0.4)
                VStack(alignment: .center, spacing: 15){
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
