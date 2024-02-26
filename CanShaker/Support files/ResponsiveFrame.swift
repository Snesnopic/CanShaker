//
//  ResponsiveFrame.swift
//
//
//  Created by Giuseppe Casillo on 23/11/23.
//

import SwiftUI

struct ResponsiveFrame: ViewModifier {
    
    let screenWidth = UIWindow.current?.screen.bounds.width
    let screenHeight = UIWindow.current?.screen.bounds.height
    
    var widthPercentage: CGFloat?
    var heightPercentage: CGFloat?
    var aspectRatio: (CGFloat, CGFloat)?
    var alignment: Alignment?
    
    func body(content: Content) -> some View {
        
        if(aspectRatio == nil){
            if(widthPercentage != nil){
                let contentWidth: CGFloat = ((screenWidth!/100) * widthPercentage!)
                
                if(heightPercentage != nil){
                    let contentHeight: CGFloat = ((screenHeight!/100) * heightPercentage!)
                    content
                        .frame(width: contentWidth, height: contentHeight, alignment: alignment!)
                }
                else{
                    content
                        .frame(width: contentWidth, alignment: alignment!)
                }
            }
            
            else{
                if(heightPercentage != nil){
                    let contentHeight: CGFloat = ((screenHeight!/100) * heightPercentage!)
                    content
                        .frame(height: contentHeight, alignment: alignment!)
                }
                else{
                    content
                        .frame(alignment: alignment!)
                }
            }
        }
        else{
            if(widthPercentage != nil){
                let contentWidth: CGFloat = ((screenWidth!/100) * widthPercentage!)
                let contentHeight: CGFloat = ((contentWidth / aspectRatio!.0) * aspectRatio!.1 )
                content
                    .frame(width: contentWidth, height: contentHeight, alignment: alignment!)
            }
            else{
                let contentHeight: CGFloat = ((screenHeight!/100) * heightPercentage!)
                let contentWidth: CGFloat = ((contentHeight / aspectRatio!.0) * aspectRatio!.1 )
                content
                    .frame(width: contentWidth, height: contentHeight, alignment: alignment!)
            }
        
        }
    }
}

extension View {
    /// Positions this view within an invisible dynamic frame having the specified size percentages
    /// constraints.
    public func responsiveFrame(widthPercentage: CGFloat? = nil, heightPercentage: CGFloat? = nil, alignment: Alignment = .center) -> some View {
        modifier(ResponsiveFrame(widthPercentage: widthPercentage, heightPercentage: heightPercentage, alignment: alignment))
        
    }
    
    /// Positions this view within an invisible dynamic frame having the specified width percentage
    /// constraint and a given aspect ratio.
    public func responsiveFrame(widthPercentage: CGFloat, aspectRatio: (CGFloat, CGFloat)? = nil, alignment: Alignment = .center) -> some View {
        modifier(ResponsiveFrame(widthPercentage: widthPercentage, aspectRatio: aspectRatio, alignment: alignment))
    }
    
    /// Positions this view within an invisible dynamic frame having the specified height percentage
    /// constraint and a given aspect ratio.
    public func responsiveFrame(heightPercentage: CGFloat, aspectRatio: (CGFloat, CGFloat)? = nil, alignment: Alignment = .center) -> some View {
        modifier(ResponsiveFrame(heightPercentage: heightPercentage, aspectRatio: aspectRatio, alignment: alignment))
    }
}

extension UIWindow {
    static var current: UIWindow? {
        for scene in UIApplication.shared.connectedScenes {
            guard let windowScene = scene as? UIWindowScene else { continue }
            for window in windowScene.windows {
                if window.isKeyWindow { return window }
            }
        }
        return nil
    }
}
