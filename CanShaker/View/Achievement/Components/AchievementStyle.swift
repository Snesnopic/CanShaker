//
//  AchievementStyle.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 28/02/24.
//

import SwiftUI

struct AchievementStyle: View {
    @State var title: String
    var body: some View {
        VStack{
            Image(systemName: "circle.inset.filled")
                .resizable()
                .responsiveFrame(widthPercentage: 20, aspectRatio: (1,1))
                .foregroundStyle(.green)
            Text(title)
                .foregroundStyle(.white)
                .bold()
        }
    }
}

#Preview {
    AchievementStyle(title: "Title")
}
