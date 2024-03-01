//
//  Authentication.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 01/03/24.
//

import Foundation
import LocalAuthentication

func faceIdAuthentication(){
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            let reason = "Authenticate to access the app"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason){ success, authenticationError in
                if success{
                    print("successed")
                
                }else{
                    print("failed")
                }
            }
        }else{
            // Device does not support Face ID or Touch ID
            print("Biometric authentication unavailable")
        }
    }
