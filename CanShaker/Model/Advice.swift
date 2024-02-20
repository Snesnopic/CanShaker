//
//  Advice.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 20/02/24.
//

import Foundation

class Advice: Identifiable{
    let id: UUID
    let title: String
    let description: String
    let category: adviceCategory
    
    init(id: UUID, title: String, description: String, category: adviceCategory) {
        self.id = id
        self.title = title
        self.description = description
        self.category = category
    }
}

enum adviceCategory{
    case hygiene
    case methods
}
