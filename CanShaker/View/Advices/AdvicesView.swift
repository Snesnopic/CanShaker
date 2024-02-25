//
//  AdvicesView.swift
//  CanShaker
//
//  Created by Giuseppe Francione on 16/02/24.
//

import SwiftUI

struct AdvicesView: View {
    var body: some View {
        NavigationStack {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.lightBP, .darkBP]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                //TODO: add list destination with advices category
                VStack{
                   NavigationLink(destination: AdvicesListView(advCategory: "Hygiene"), label: {
                       AdviceButtonStyle(img: "heart.text.square.fill", category: "Hygiene", cDescription: "Lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum")
                   })
                    
                    NavigationLink(destination: AdvicesListView(advCategory: "Methods"), label: {
                        AdviceButtonStyle(img: "book.closed.fill", category: "Methods", cDescription: "Lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum")
                    })
                    
                    
                    NavigationLink(destination: AdvicesListView(advCategory: "Safety"), label: {
                        AdviceButtonStyle(img: "exclamationmark.triangle.fill", category: "Safety", cDescription: "Lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum")
                    })
                    
                    Spacer()
                    
                }
            }
            .navigationTitle("Advices")
            .preferredColorScheme(.dark)
            
            //accentColor changed backButton color
        }.accentColor(.white)
    }
}

#Preview {
    AdvicesView()
}
