//
//  Socket.swift
//  TeaWatch Watch App
//
//  Created by Batuhan Küçükyıldız on 9.01.2024.
//

import Foundation
import SocketIO

final class Socket {
    static let sharedSocket = Socket() // Singleton Pattern
    let manager: SocketManager = SocketManager(socketURL: URL(string: Constants.baseUrl)!, config: [.log(false), .compress])
    let socket: SocketIOClient
    private init() {
        self.socket = manager.defaultSocket
    }
    /**
     func receiveMessage(socketUpdateId: String, completion: @escaping (Result<Double, Error>) -> Void)
     - parameter socketUpdateId: Type String, The socket id we want to connect
     - returns: Completion success or failure  /  Data Type -> Double, Error Type -> Error
     */
    func receiveMessage(socketUpdateId: String, completion: @escaping (Result<Double, Error>) -> Void) {
        socket.on(socketUpdateId) { (data, ack) in
            if let data = data[0] as? Double {
                completion(.success(data))
            } else {
                let error = NSError(domain: "SocketErrorDomain", code: 1, userInfo: [NSLocalizedDescriptionKey: "Data parsing error"])
                completion(.failure(error))
            }
        }
    }
    
    // initiates a socket connection
    func socketConnect() {
        socket.connect()
    }
    // terminates the connection to the connected socket
    func socketDisconnect() {
        socket.disconnect()
    }
}
