//
//  SessionView.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 15/02/24.
//

import SwiftUI
import HealthKit
import CoreMotion
import SwiftData

enum SessionState {
    case start
    case shaking
    case done
}
struct SessionView: View {
    @Environment(\.modelContext) var modelContext
    @Binding var currentState: SessionState
    @Binding var firstTabView:Int
    @State var secondTabView:Int = 2
    @State var circleAnimationAmount:Double = 1.0
    @State var sprayCanRotationAmount:Double = 0
    @State var sprayCanTranslationAmount:Double = 0
    @ObservedObject var motionManager = MotionDataManager.shared
    var connectivity:Connectivity = Connectivity.shared
    var body: some View {
        NavigationStack {
            switch currentState {
            case .start:
                Button(action: {
                    currentState = .shaking
                    motionManager.startQueuedUpdates()
                }, label: {
                    ZStack {
                        Circle()
                            .foregroundStyle(.graffiti.opacity(0.5))
                            .scaleEffect(circleAnimationAmount)
                            .onAppear{
                                withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                                    circleAnimationAmount *= 1.2
                                }
                            }
                            .onDisappear{
                                circleAnimationAmount = 1.0
                            }
                            .padding()
                        Circle()
                            .foregroundStyle(.graffiti)
                            .padding()
                        Text("Start")
                            .bold()
                            .font(.title)
                    }
                })
                .buttonStyle(.plain)
                
            case .shaking:
                TabView(selection: $secondTabView){
                    Button(role: .destructive,
                           action: {
                        print("Done!")
                        motionManager.stopQueuedUpdates()
                        modelContext.insert(motionManager.session!)
                        currentState = .done
                        self.firstTabView = 1
                    }, label: {
                        Text("I'm done")
                        
                    })
                    .tag(1)
                    
                    Image("SprayCan")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .rotationEffect(.degrees(sprayCanRotationAmount))
                        .onAppear{
                            withAnimation(.easeInOut(duration: 0.3).repeatForever(autoreverses: true)) {
                                sprayCanRotationAmount += 30
                                sprayCanTranslationAmount += 20
                            }
                        }
                        .onDisappear{
                            sprayCanRotationAmount = 0
                            sprayCanTranslationAmount = 0
                        }
                        .offset(CGSize(width: 0.0, height: -sprayCanTranslationAmount))
                        .tag(2)
                }
                .tabViewStyle(.page)
                
            case .done:
                Text("You just finished a session!")
            }
            
        }
    }
}

#Preview {
    SessionView(currentState: .constant(.shaking), firstTabView: .constant(0))
}
