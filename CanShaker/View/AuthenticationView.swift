//
//  AuthenticationView.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 01/03/24.
//

import SwiftUI

struct AuthenticationView: View {
    @State private var isUnlocked = false
    var body: some View {
        VStack{
            Button(action: {
                faceIdAuthentication()
            }, label: {
               
                    RoundedRectangle(cornerRadius: 20)
                        .responsiveFrame(widthPercentage: 70, heightPercentage: 7)
                        .foregroundStyle(Color("boxColor"))
                        .opacity(0.5)
                        .overlay{
                            HStack{
                                Image(systemName: "faceid")
                                    .font(.largeTitle)
                                Text("Authenticate with face ID")
                                    .foregroundStyle(.white)
                            }
                        }
                    
                    
            })
        }
        .preferredColorScheme(.dark)
    }
    
    
}




#Preview {
    AuthenticationView()
}
