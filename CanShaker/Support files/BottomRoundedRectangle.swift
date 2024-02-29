//
//  RoundedRectangleShape.swift
//  CanShaker
//
//  Created by Davide Castaldi on 29/02/24.
//

import Foundation
import SwiftUI

struct BottomRoundedRectangle: Shape {
    
    var cornerRadius: CGFloat
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        //angolo alto-sx
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        //lato top
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        //angolo alto-dx
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        //angolo basso-dx rounded
        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius),
                    radius: cornerRadius,
                    startAngle: .zero,
                    endAngle: .init(degrees: 90),
                    clockwise: false)
        //angolo basso-sx rounded
        path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY - cornerRadius),
                    radius: cornerRadius,
                    startAngle: .init(degrees: 90),
                    endAngle: .init(degrees: 180),
                    clockwise: false)
        // Close the path
        path.closeSubpath()

        return path
    }
}
