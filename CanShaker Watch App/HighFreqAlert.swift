//
//  HighFreqAlert.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 16/02/24.
//

import SwiftUI

struct HighFreqAlert: View {
    var body: some View {
        Text("Hello World")
            .alert(isPresented: .constant(true), content: {
                Alert(
                    title: Text("Are you sure? Too many sessions can cause serious health issues!"),
                    primaryButton: .default(Text("Do it anyway")),
                    secondaryButton: .destructive(Text("Go back"))
                    
                )})
    }
}

#Preview {
    HighFreqAlert()
}
