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
        return switch self {
        case .hygiene: String(localized: "Hygiene")
        case .methods: String(localized: "Methods")
        case .safety: String(localized: "Safety")
        }
    }
}
