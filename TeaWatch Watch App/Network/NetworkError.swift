//
//  NetworkError.swift
//  TeaWatch Watch App
//
//  Created by Batuhan Küçükyıldız on 8.01.2024.
//

import Foundation

enum NetworkError: Error {
    case jsonDecoderError
    case authenticationError
    case badRequest
    case networkError
}
