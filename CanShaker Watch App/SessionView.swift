//
//  SessionView.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 15/02/24.
//

import SwiftUI
import HealthKit
import CoreMotion
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
    @State  var timer:Timer = Timer()
    var body: some View {
        NavigationStack {
            switch currentState {
            case .start:
                Button(action: {
                    currentState = .shaking
                    var motion = CMMotionManager()
                    print(motion.isDeviceMotionAvailable)
                    if motion.isDeviceMotionAvailable {
                        motion.deviceMotionUpdateInterval = 1.0/50.0
                        motion.showsDeviceMovementDisplay = true
                        motion.startDeviceMotionUpdates(using: .xMagneticNorthZVertical)
                        timer = Timer(fire: Date(), 
                                      interval: (1.0/50.0),
                                      repeats: true,
                                      block: { timer in
                            if let data = motion.deviceMotion {
                                let accel = data.userAcceleration
                                print(accel)
                            }
                        })
                        RunLoop.current.add(self.timer, forMode: RunLoop.Mode.default)
                    }
                    
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
}

#Preview {
    SessionView(currentState: .constant(.start), firstTabView: .constant(1))
}
