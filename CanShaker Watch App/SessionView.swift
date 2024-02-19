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
    var body: some View {
        NavigationStack {
            switch currentState {
            case .start:
                Button(action: {
                    currentState = .shaking
                }, label: {
                    ZStack {
                        Circle()
                            .foregroundStyle(.orange)
                        Text("Start session")
                            .bold()
                            .foregroundStyle(.background)
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
}

#Preview {
    SessionView(currentState: .constant(.start), firstTabView: .constant(1))
}
