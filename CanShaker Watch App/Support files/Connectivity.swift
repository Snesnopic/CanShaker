//
//  Connectivity.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 26/02/24.
//

import Foundation
import WatchConnectivity
import CoreMotion
final class Connectivity: NSObject, ObservableObject, WCSessionDelegate {
    //se iOS perde la connessione con watchOS, riprova
#if os(iOS)
    public func sessionDidBecomeInactive(_ session: WCSession) { }
    public func sessionDidDeactivate(_ session: WCSession) {
        session.activate()
    }
#endif
    //variabile che iOS userà per accedere alle sessioni
    @Published var sessions:[Session] = []
    
    static let shared = Connectivity()
    override private init() {
        super.init()
        let session = WCSession.default
        session.delegate = self
        session.activate()
    }
    
    // funzione per mandare tutte le sessioni
    func send(sessions: [Session]) {
        print("Current activation state: \(WCSession.default.activationState.rawValue)")
        guard WCSession.default.activationState == .activated else {
            return
        }
        print("Has content pending: \(WCSession.default.hasContentPending.description)")
#if os(watchOS)
        print("Is companion app installed\(WCSession.default.isCompanionAppInstalled)")
#endif
        var message:[String: Any] = [:]
        let jsonEncoder = JSONEncoder()
        sessions.forEach { session in
            message[UUID().uuidString] = session
        }
        let data = try! jsonEncoder.encode(sessions)
        WCSession.default.sendMessageData(data,replyHandler: nil, errorHandler: { error in
            print(error)
        })
        
    }
    //funzione per quando ricevi sessioni da watchOS
    func session(_ session: WCSession, didReceiveMessageData messageData: Data) {
        print("Received \(messageData)")
        let jsonDecoder = JSONDecoder()
        
        sessions = try! jsonDecoder.decode([Session].self, from: messageData)
        print("Ho ricevuto \(sessions.count) sessioni")
        
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    
}
