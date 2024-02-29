//
//  Connectivity.swift
//  CanShaker Watch App
//
//  Created by Giuseppe Francione on 26/02/24.
//

import Foundation
import WatchConnectivity
import CoreMotion
import SwiftData
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
    var phoneSessionIds:Set<String> = []
    var isListReady:Bool = false
    static let shared = Connectivity()
    var context:ModelContext? = nil
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
        let data:Data!
        isListReady = false
        while isListReady == false {
            
        }
        if phoneSessionIds.count == 0 {
            print("Mando tutto perché il telefono ha 0 sessioni")
            data = try! jsonEncoder.encode(sessions)
        }
        else {
            let reducedSessions = sessions.filter { session in
                return !phoneSessionIds.contains(session.uuid.uuidString)
            }
            print("Ho \(sessions.count - reducedSessions.count) da mandare")
            reducedSessions.forEach { session in
                print("ID sessione da mandare: \(session.uuid)")
            }
            data = try! jsonEncoder.encode(Array(reducedSessions))
        }
        print("Data to send before compression: \(data!)")
        do {
            let compressedData = try (data as NSData).compressed(using: .lzma) as Data
            print("Data to send after compression: \(compressedData)")
            isListReady = true
            WCSession.default.sendMessageData(compressedData,replyHandler: nil, errorHandler: { error in
                print(error)
            })
            
        } catch {
            print(error.localizedDescription)
        }
    }
    //funzione per quando ricevi sessioni da watchOS
    func session(_ session: WCSession, didReceiveMessageData messageData: Data) {
        print("Received \(messageData)")
        
        let jsonDecoder = JSONDecoder()
        do {
            let decompressedData = try (messageData as NSData).decompressed(using: .lzma) as Data
            sessions = try! jsonDecoder.decode([Session].self, from: decompressedData)
            sessions.sort { session1, session2 in
                return session1.date > session2.date
            }
            for se in sessions{
                context!.insert(se)
            }
            print("Ho ricevuto \(sessions.count) sessioni")
        }
        catch {
            print(error)
        }
        
    }
    //ricevi quante sessioni ha il watch e manda quante ne hai tu
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        print("Received \(message)")
        //non mi importa di quante sessioni ha il watch
        //        let sessionsCount = message["count"] as? Int ?? 0
        
        do {
            var replyMessage: [String:String] = [:]
            let sessions:[Session] = try context!.fetch(FetchDescriptor<Session>())
            sessions.forEach { session in
                replyMessage[UUID().uuidString] = session.uuid.uuidString
            }
            replyMessage.forEach { (key: String, value: String) in
                print("ID che già ho sul telefono: \(value)")
            }
            replyHandler(replyMessage)
        }
        catch {
            print("Error: \(error)")
        }
        //        let replyMessage: [String: Any] = ["replyMessage": sessions.count]
        
    }
    //manda il numero di sessioni del watch all'iOS e si aspetta la risposta del suo numero
    func sendCount() {
        guard WCSession.default.activationState == .activated else {
            return
        }
        print("Has content pending: \(WCSession.default.hasContentPending.description)")
#if os(watchOS)
        print("Is companion app installed\(WCSession.default.isCompanionAppInstalled)")
#endif
        let message:[String: Any] = ["count":sessions.count]
        WCSession.default.sendMessage(message) { reply in
            self.isListReady = false
            print("Reply: \(reply)")
            reply.forEach { (key: String, value: Any) in
                print("ID ricevuto dell'iPhone = \(value as! String)")
                self.phoneSessionIds.insert(value as! String)
            }
            self.isListReady = true
        } errorHandler: { error in
            print("Errore nel mandare il session count ad iOS: \(error)")
        }
        
        
    }
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    
}
