//
//  SocketViewModel.swift
//  TeaWatch Watch App
//
//  Created by Batuhan Küçükyıldız on 9.01.2024.
//

import Foundation



class SocketViewModel: ObservableObject {
    @Published var initialCountdownFloorOne: Double = 0
    @Published var initialCountdownFloorTwo: Double = 0
    @Published var initialCountdownFloorThree: Double = 0
    let socket = Socket()
    init() {
        socket.socketFunc { result in
            switch result {
    
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        }
    }
}
