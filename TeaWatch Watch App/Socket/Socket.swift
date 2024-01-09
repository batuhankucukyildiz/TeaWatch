//
//  Socket.swift
//  TeaWatch Watch App
//
//  Created by Batuhan Küçükyıldız on 9.01.2024.
//

import Foundation
import SocketIO

class Socket {
    let manager: SocketManager
    let socket: SocketIOClient
    
    init() {
        guard let baseURL = URL(string: Constants.baseUrl) else {
            fatalError("Invalid base URL")
        }

        self.manager = SocketManager(socketURL: baseURL, config: [.log(true), .compress])
        self.socket = manager.defaultSocket

    }
    
    // Refactor
    func socketFunc(completion: @escaping (Result<Double, Error>) -> Void) {
        socket.on("initialCountdownFloorTwo") { data, ack in
            if let secondsRemaining = data[0] as? Double {
                completion(.success(secondsRemaining))
            } else {
                let error = NSError(domain: "SocketErrorDomain", code: 1, userInfo: [NSLocalizedDescriptionKey: "Data parsing error"])
                completion(.failure(error))
            }
        }
        socket.connect()
    }

}
