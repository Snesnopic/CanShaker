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
    
    init(id: UUID, title: String, description: String) {
        self.id = id
        self.title = title
        self.description = description
    }
}
