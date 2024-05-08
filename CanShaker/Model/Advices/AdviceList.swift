//
//  AdviceList.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 25/02/24.
//

import Foundation

extension Advice {
    static let list = [
        Advice(title: String(localized: "Clean hands"), description: String(localized: "Wash hands before and after: Before engaging in shaking your can, ensure that your hands are clean to minimize the introduction of bacteria or other contaminants to the shaking area. Afterward, wash your hands thoroughly to remove any unwanted spray and reduce the risk of spreading bacteria."), category: .hygiene),
        Advice(title: String(localized: "Lube up your can for comfort"), description: String(localized: "Using a water-based lubricant during the shaking can help reduce friction and irritation of the can. This is especially important if you're prone to dryness or sensitivity. Avoid using products like lotions, oils, or creams that may contain ingredients that could irritate the delicate skin of your poor can."), category: .hygiene),
        Advice(title: String(localized: "Post shake hygiene"), description: String(localized: "Like any utensil, clean it after usage, gently wash the shaking area with warm water and a mild, unscented soap to remove any remaining lubricant or spray. Be sure to rinse thoroughly and pat dry with a clean towel. Keeping the shaking area clean helps prevent the buildup of bacteria and reduces the risk of skin irritation or infection."), category: .hygiene),
        //
        //let's separate for visibility and filtering by category
        //
        Advice(title: String(localized: "Slow Down"), description: String(localized: "Rushing to the end often leads to a brief peak followed by a quick decline. Taking your time to build up gradually results in more intense artwork."), category: .methods),
        Advice(title: String(localized: "Try Edging"), description: String(localized: "Practice holding back when nearing the end of your inspiration, then resume stimulation. Repeating this pattern enhances artwork output intensity and duration."), category: .methods),
        Advice(title:String(localized:  "Use Lube"), description: String(localized: "Enhance pleasure and reduce friction-related discomfort by using natural lubricants."), category: .methods),
        //
        //let's separate for visibility and filtering by category
        //
        Advice(title: String(localized: "Hurting yourself"), description: String(localized: "If you start feeling hurt or you feel your can is dry, it is a great sign that you should stop painting."), category: .safety),
        Advice(title: String(localized: "Relationships and work-life impact"), description: String(localized: "If you can’t complete a work task because you can’t stop thinking about shaking your can, that’s when it becomes an issue. If you’re consistently watching graffiti material at work or are you’re late to a meeting because you were shaking it in the bathroom, then you might have to consult an expert. This is the same if you can’t stick with plans made with friends."), category: .safety),
        Advice(title: String(localized: "Quiet place"), description: String(localized: "Find a quiet, private area where you won't be disturbed or interrupted. Nobody likes doing graffiti when cops are around. Interruptions can cause instability during your experience and may lead to unpleasent discoveries"), category: .safety),
    ]
}
