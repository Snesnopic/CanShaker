//
//  Connectivity.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 26/02/24.
//

import Foundation
import WatchConnectivity

final class Connectivity: NSObject, ObservableObject {
    @Published var allSessions:[Session] = []
    static let shared = Connectivity()
    
    //inizializza e controlla se l'iPhone ha un Apple Watch
    private override init() {
        super.init()
#if !os(watchOS)
        guard WCSession.isSupported() else {
            return
        }
#endif
        
        WCSession.default.delegate = self
        WCSession.default.activate()
    }
    
    //prova a mandare una
    public func send(sessions: [Session]) {
#if os(watchOS)
        guard WCSession.default.isCompanionAppInstalled else {
            return
        }
#else
        guard WCSession.default.isWatchAppInstalled else {
            return
        }
#endif
        guard WCSession.default.activationState == .activated else {
            return
        }
        var userInfo: [String: Session] = [:]
        sessions.forEach { session in
            userInfo[UUID().uuidString] = session
        }
        WCSession.default.transferUserInfo(userInfo)
    }
    
    
}

extension Connectivity: WCSessionDelegate {
    func session(
        _ session: WCSession,
        activationDidCompleteWith activationState: WCSessionActivationState,
        error: Error?
    ) {
        
    }
    func session(
        _ session: WCSession,
        didReceiveUserInfo userInfo: [String: Any] = [:]
    ) {
        print("Userinfo: \(userInfo)")
        userInfo.forEach { (key: String, value: Any) in
            var session = value as! Session
            allSessions.append(session)
        }
    }
 
#if os(iOS)
    func sessionDidBecomeInactive(_ session: WCSession) {
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        WCSession.default.activate()
    }
#endif
}
