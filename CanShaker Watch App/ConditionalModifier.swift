//
//  ConditionalModifier.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 16/02/24.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder func `if`<T>(_ condition: Bool, transform: (Self) -> T) -> some View where T: View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
