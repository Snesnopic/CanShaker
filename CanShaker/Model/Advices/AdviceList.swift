//
//  AdviceList.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 25/02/24.
//

import Foundation

extension Advice {
    static let list = [
        Advice(title: "Clean hands", description: "Wash hands before and after: Before engaging in masturbation, ensure that your hands are clean to minimize the introduction of bacteria or other contaminants to the genital area. Afterward, wash your hands thoroughly to remove any bodily fluids and reduce the risk of spreading bacteria to other parts of your body or objects you may touch.", category: .hygiene),
        Advice(title: "Lube up for comfort", description: "Use lubrication: Using a water-based lubricant during masturbation can help reduce friction and irritation on the skin of the penis. This is especially important if you're prone to dryness or sensitivity. Avoid using products like lotions, oils, or creams that may contain ingredients that could irritate the delicate skin of the genital area.", category: .hygiene),
        Advice(title: "Post session hygiene", description: "Clean genitals afterward: After masturbation, gently wash the genital area with warm water and a mild, unscented soap to remove any remaining lubricant, semen, or other bodily fluids. Be sure to rinse thoroughly and pat dry with a clean towel. Keeping the genital area clean helps prevent the buildup of bacteria and reduces the risk of skin irritation or infection.", category: .hygiene),
        //
        //let's separate for visibility and filtering by category
        //
        Advice(title: "Slow Down", description: "Rushing to climax often leads to a brief peak followed by a quick decline. Taking your time to build up gradually results in more intense orgasms.", category: .methods),
        Advice(title: "Try Edging", description: "Practice holding back when nearing climax, then resuming stimulation. Repeating this pattern enhances orgasm intensity and duration.", category: .methods),
        Advice(title: "Use Lube", description: "Enhance pleasure and reduce friction-related discomfort by using natural lubricants.", category: .methods),
        //
        //let's separate for visibility and filtering by category
        //
        Advice(title: "Hurting yourself", description: "If you start feeling hurt or you feel your skin is dry, it is a great sign that you should stop doing what you're doing.", category: .safety),
        Advice(title: "Relationships and work-life impact", description: "If you can’t complete a work task because you can’t stop thinking about masturbating, that’s when it becomes an issue. If you’re consistently watching porn at work or are you’re late to a meeting because you were masturbating in the bathroom, then you likely have a problem. This is the same if you can’t stick with plans made with friends.", category: .safety),
        Advice(title: "Quiet place", description: "Find a quiet, private area where you won't be disturbed or interrupted. Interruptions can cause instability during your experience and may lead to unpleasent discoveries", category: .safety),
    ]
}
