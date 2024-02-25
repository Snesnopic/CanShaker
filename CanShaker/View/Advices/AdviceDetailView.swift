//
//  AdviceDetailView.swift
//  CanShaker
//
//  Created by Giuseppe Casillo on 25/02/24.
//

import SwiftUI

struct AdviceDetailView: View {
    @State var adv: Advice
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.lightBP, .darkBP]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack{
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                
            }
        }
        .preferredColorScheme(.dark)
        .navigationTitle(adv.title)
    }
}


#Preview {
    AdviceDetailView(adv: Advice(title: "Test", description: "Lorem tunz tunz tunz", category: .hygiene))
}
