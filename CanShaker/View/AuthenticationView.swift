//
//  AuthenticationView.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 01/03/24.
//

import SwiftUI
import LocalAuthentication

struct AuthenticationView: View {
    @State private var isUnlocked = false
    @State private var test = "just in"
    var body: some View {
        VStack{
            Text(test)
            Button(action: {
                authenticateUser()
            }, label: {
                
                RoundedRectangle(cornerRadius: 20)
                    .responsiveFrame(widthPercentage: 70, heightPercentage: 7)
                    .foregroundStyle(Color("boxColor"))
                    .opacity(0.5)
                    .overlay{
                            Text("Authenticate")
                                .foregroundStyle(.white)
                        
                    }
                
                
            })
        }
        .preferredColorScheme(.dark)
    }
    
    func authenticateUser() {
        let authenticationContext = LAContext()
        var error: NSError?
        
        // Check if the device can evaluate the policy.
        if authenticationContext.canEvaluatePolicy(LAPolicy.deviceOwnerAuthentication, error: &error) {
            
            authenticationContext.evaluatePolicy( .deviceOwnerAuthentication, localizedReason: "Use youre face to unlock.", reply: { (success, evalPolicyError) in
                
                if success {
                    test = "good "
                } else {
                    test = "failed "
                }
                
            })
            
        }else {
            test = "no auth a found"

        }
    }
}




#Preview {
    AuthenticationView()
}
