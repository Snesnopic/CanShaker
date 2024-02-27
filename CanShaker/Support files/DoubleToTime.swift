//
//  DoubleToTime.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 27/02/24.
//

import Foundation

func doubleToTime(doubleNumber: inout Double) -> String{
    
    if(doubleNumber < 60){
        return (String(Int(doubleNumber)) + String("s"))
    }else {
        let reminder = (doubleNumber.truncatingRemainder(dividingBy: 60.0))
        doubleNumber /= 60.0
        
        return (String(Int(doubleNumber)) + String(":") + String(Int(reminder)) + String("m"))
    }
    
}
