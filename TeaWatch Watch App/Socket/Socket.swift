//
//  Socket.swift
//  TeaWatch Watch App
//
//  Created by Batuhan Küçükyıldız on 9.01.2024.
//

import Foundation
import SocketIO

class Socket {
    let manager: SocketManager = SocketManager(socketURL: URL(string: Constants.baseUrl)!, config: [.log(false), .compress])
    let socket: SocketIOClient
    init() {
        self.socket = manager.defaultSocket
        socket.connect()
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
    
    func socketDisconnect() {
        socket.disconnect()
    }
}
