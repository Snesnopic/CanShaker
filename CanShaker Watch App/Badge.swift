//
//  Badge.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 19/02/24.
//

import Foundation
import SwiftUI

class Badge {
    init(name: String, color: Color, description: String) {
        self.name = name
        self.color = color
        self.description = description
    }
    var name:String
    var color: Color
    var description:String
}
