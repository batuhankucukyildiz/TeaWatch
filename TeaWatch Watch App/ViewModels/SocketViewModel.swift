//
//  SocketViewModel.swift
//  TeaWatch Watch App
//
//  Created by Batuhan Küçükyıldız on 9.01.2024.
//

import Foundation
import SocketIO

class SocketViewModel: ObservableObject {
    @Published var initialCountdownFloor: Double = 0
    var socket = Socket()

    func socketBegin(socketUpdateId: String) {
        socket.receiveMessage(socketUpdateId: socketUpdateId) { result in
            switch result {
            case .success(let data):
                self.initialCountdownFloor = data
            case .failure(let error):
                print(error)
            }
        }
    }

    func socketDisconnect() {
        socket.socketDisconnect()
    }
}


