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
    // Refactor
    func receiveMessage(completion: @escaping (Result<Double, Error>) -> Void) {
        socket.on("connectUser") { (data, ack) in
            if let data = data[0] as? Double {
                completion(.success(data))
            } else {
                let error = NSError(domain: "SocketErrorDomain", code: 1, userInfo: [NSLocalizedDescriptionKey: "Data parsing error"])
                completion(.failure(error))
            }
        }
    }

    
    // add disconnect method
    func socketDisconnect() {
        socket.disconnect()
    }

}
