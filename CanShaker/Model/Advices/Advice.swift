//
//  Advice.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 20/02/24.
//

import Foundation

class Advice: Identifiable{
    let id: UUID = UUID()
    let title: String
    let description: String
    let category: adviceCategory
    
    init(title: String, description: String, category: adviceCategory) {
        self.title = title
        self.description = description
        self.category = category
    }
}

enum adviceCategory {
    case hygiene
    case methods
    case safety
    
    var str: String {
        switch self {
        case .hygiene: return "Hygiene"
        case .methods: return "Methods"
        case .safety: return "Safety"
        }
    }
}
