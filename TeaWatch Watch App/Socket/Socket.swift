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
    func socketFunc() {
        
        socket.on("initialCountdownFloorTwo") { data, ack in
            if let secondsRemaining = data[0] as? Double {
               // Burada secondsRemaining değerini kullanabilirsiniz
               print("Received secondsRemaining: \(secondsRemaining)")
            }
        }
        socket.on(clientEvent: .disconnect) { data, ack in
            print("Socket disconnected")
        }

        socket.on(clientEvent: .reconnect) { data, ack in
            print("Socket reconnected")
        }
        
        socket.connect()
    }
}
