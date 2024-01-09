//
//  TeaSendMessageViewModel.swift
//  TeaWatch Watch App
//
//  Created by Batuhan Küçükyıldız on 8.01.2024.
//

import Foundation


class TeaSendMessageViewModel: ObservableObject {
    let service: TeaSendMessageServiceProtocol?
    
    init(service: TeaSendMessageServiceProtocol?) {
        self.service = service
    }
    
    func teaBrew(_ id: String) {
        service?.teaSendMessage(id: id, completion: { result in
            switch result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        })
    }
    func teaFinish(_ id: String) {
        service?.teaSendMessage(id: id, completion: { result in
            switch result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        })
    }
}
