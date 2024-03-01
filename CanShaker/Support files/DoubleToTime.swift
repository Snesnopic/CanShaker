//
//  DoubleToTime.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 27/02/24.
//

import Foundation

extension Double {
    func doubleToTime() -> String{
        
        var dbn = Int(self)
        
        if(dbn < 60){
            return (String(dbn) + String("s"))
        }else {
            let reminder = dbn % 60
            var strReminder = String(reminder)
            dbn /= 60
            
            if(reminder < 10){
                strReminder = "0" + strReminder
            }
            
            return (String(dbn) + String(":") + strReminder + String("m"))
        }
        
    }
}
