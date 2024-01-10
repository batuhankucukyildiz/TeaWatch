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
    let socketService: SocketServicesProtocol?
    init(socketService: SocketServicesProtocol?) {
        self.socketService = socketService
    }

    func socketBegin(socketUpdateId: String) {
        socketService?.receiveMessage(socketUpdateId: socketUpdateId) { result in
            switch result {
            case .success(let data):
                self.initialCountdownFloor = data
            case .failure(let error):
                print(error)
            }
        }
    }
    func socketConnect() {
        socketService?.socketConnect()
    }
    func socketDisconnect() {
        socketService?.socketDisconnect()
    }
}


