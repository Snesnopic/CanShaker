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
            
                VStack(spacing: 15){
                    NavigationLink(destination: AdvicesListView(advCategory: .hygiene), label: {
                        AdviceButtonStyle(img: "heart.text.square.fill", category: "Hygiene", cDescription: "Learn how to keep your can always in top shape", backgroundImg: "hygiene")
                        
                    })
                    .padding(.top, 20)
                    NavigationLink(destination: AdvicesListView(advCategory: .methods), label: {
                        AdviceButtonStyle(img: "book.closed.fill", category: "Methods", cDescription: "There are secret graffiti techniques to explore", backgroundImg: "methods")
                        
                    })
                    NavigationLink(destination: AdvicesListView(advCategory: .safety), label: {
                        AdviceButtonStyle(img: "exclamationmark.triangle.fill", category: "Safety", cDescription: "You have to keep your can safe", backgroundImg: "safety")
                        
                    })
                    Spacer()
                }
                .accentColor(.white)
                .navigationTitle("Advices")
                .preferredColorScheme(.dark)
                .frame(maxWidth: .infinity)
                .background{
                    Color(Color("bgGray"))
                }
        }
    }
}

#Preview {
    AdvicesView()
}
