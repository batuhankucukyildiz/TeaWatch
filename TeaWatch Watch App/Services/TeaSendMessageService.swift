//
//  TeaSendMessageService.swift
//  TeaWatch Watch App
//
//  Created by Batuhan Küçükyıldız on 8.01.2024.
//

import Foundation


protocol TeaSendMessageServiceProtocol {
    func teaSendMessage(id: String, completion: @escaping(Result<TeaResultModel, Error>) -> Void) -> Void
}

class TeaSendMessageService: TeaSendMessageServiceProtocol {
    func teaSendMessage(id: String, completion: @escaping (Result<TeaResultModel, Error>) -> Void) {
        let endpoint = Endpoint.sendFloorData(id: id)
        NetworkManager.shared.request(endpoint, completion: completion)
    }
}
