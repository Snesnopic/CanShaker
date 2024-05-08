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

struct SessionView: View {
    @Environment(\.modelContext) var modelContext
    @Binding var firstTabView:Int
    @State var secondTabView:Int = 2
    @State var circleAnimationAmount:Double = 1.0
    @State var sprayCanRotationAmount:Double = 0
    @State var sprayCanTranslationAmount:Double = 0
    @ObservedObject var motionManager = MotionDataManager.shared
    @Binding var isShaking:Bool
    var connectivity:Connectivity = Connectivity.shared
    var body: some View {
        NavigationStack {
            if !isShaking {
                Button(action: {
                    isShaking = true
                    motionManager.startQueuedUpdates()
                }, label: {
                    ZStack {
                        Circle()
                            .foregroundStyle(.accent.opacity(0.5))
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
                            .foregroundStyle(.accent)
                            .padding()
                        Text("Start")
                            .bold()
                            .font(.title)
                    }
                })
                .buttonStyle(.plain)
            }
            else {
                TabView(selection: $secondTabView){
                    VStack{
                        Button(role: .destructive,
                               action: {
                            print("Done!")
                            motionManager.stopQueuedUpdates()
                            modelContext.insert(motionManager.session!)
                            isShaking = false
                            self.firstTabView = 1
                        }, label: {
                            Text("I'm done")
                            
                        })
                                                
//                        Button(role: .none,
//                               action: {
//                            print("Done!")
//                            motionManager.stopQueuedUpdates()
//                            isShaking == false ? motionManager.stopQueuedUpdates() : motionManager.startQueuedUpdates()
//                            self.firstTabView = 1
//                        }, label: {
//                            Text(isShaking == false ? "Resume" : "Pause")
//                            
//                        })
                    }
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
            }
        }
    }
}

#Preview ("Not shaking"){
    SessionView(firstTabView: .constant(0),isShaking: .constant(false))
}

#Preview ("Shaking"){
    SessionView(firstTabView: .constant(0),isShaking: .constant(true))
}
