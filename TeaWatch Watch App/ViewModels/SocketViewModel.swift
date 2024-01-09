//
//  SocketViewModel.swift
//  TeaWatch Watch App
//
//  Created by Batuhan Küçükyıldız on 9.01.2024.
//

import Foundation
import SocketIO

class SocketViewModel: ObservableObject {
    @Published var initialCountdownFloorOne: Double = 0
    @Published var initialCountdownFloorTwo: Double = 0
    @Published var initialCountdownFloorThree: Double = 0
    var socket = Socket()

    init() {
     
        socketBegin()
    }
    
    func socketBegin() {
        // Refactor
        socket.receiveMessage { result in
            switch result {
                
            case .success(let data):
                self.initialCountdownFloorTwo = data
            case .failure(let error):
                print(error)
            }
        }

    }

    
    func socketDisconnect() {
       
    }
    
}


