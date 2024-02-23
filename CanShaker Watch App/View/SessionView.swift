//
//  SessionView.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 15/02/24.
//

import SwiftUI
import HealthKit
enum SessionState {
    case start
    case shaking
    case done
}
struct SessionView: View {
    @Binding var currentState: SessionState
    @Binding var firstTabView:Int
    @State var secondTabView:Int = 2
    @State var animationAmount:Double = 1.0
    var body: some View {
        NavigationStack {
            switch currentState {
            case .start:
                Button(action: {
                    currentState = .shaking
                }, label: {
                    ZStack {
                        Circle()
                            .foregroundStyle(.graffiti.opacity(0.5))
                            .scaleEffect(animationAmount)
                            .onAppear{
                                withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                                    animationAmount *= 1.09
                                }
                            }
                        Circle()
                            .foregroundStyle(.graffiti)
                        Text("Start")
                            .bold()
                            .foregroundStyle(.background)
                            .font(.title)
                    }
                })
                .buttonStyle(.plain)
            case .shaking:
                TabView(selection: $secondTabView,
                        content:  {
                    Button(role: .destructive,
                           action: {
                        self.firstTabView = 2
                        currentState = .done
                    }, label: {
                        Text("I'm done")
                    })
                    .tag(1)
                    
                    Text("Shaking")
                        .tag(2)
                })
                .tabViewStyle(.page)
            case .done:
                Text("You just finished a session!")
            }
            
        }
    }
    
    func sendData(){
        
    }
}

#Preview {
    SessionView(currentState: .constant(.start), firstTabView: .constant(1))
}
