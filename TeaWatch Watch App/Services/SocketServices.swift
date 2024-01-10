//
//  SocketServices.swift
//  TeaWatch Watch App
//
//  Created by Batuhan Küçükyıldız on 10.01.2024.
//

import Foundation

protocol SocketServicesProtocol {
    func receiveMessage(socketUpdateId: String, completion: @escaping (Result<Double, Error>) -> Void)
    func socketConnect()
    func socketDisconnect()
}

class SocketServices: SocketServicesProtocol {
    func receiveMessage(socketUpdateId: String, completion: @escaping (Result<Double, Error>) -> Void) {
        Socket.sharedSocket.receiveMessage(socketUpdateId: socketUpdateId, completion: completion)
    }
    
    func socketConnect() {
        Socket.sharedSocket.socketConnect()
    }
    
    func socketDisconnect() {
        Socket.sharedSocket.socketDisconnect()
    }
}
