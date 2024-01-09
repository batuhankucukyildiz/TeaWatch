//
//  Endpoint.swift
//  TeaWatch Watch App
//
//  Created by Batuhan Küçükyıldız on 8.01.2024.
//

import Foundation

protocol EndpointProtocol {
    var baseUrl: String { get }
    var path: String { get }
    var httpMethod: HttpMethods { get }
    var headers: [String: Any]? { get }
    func request() -> URLRequest
}


enum HttpMethods: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case patch = "PATCH"
}

enum Endpoint {
    case sendFloorData(id: String)
    //MARK: case...
}

extension Endpoint: EndpointProtocol {
    var baseUrl: String {
        return Constants.baseUrl
    }
    
    var path: String {
        switch self {
        case .sendFloorData(_):
            return "/esp32"
        }
    }
    
    var httpMethod: HttpMethods {
        switch self {
            
        case .sendFloorData(_):
            return .post
        }
    }
    
    var headers: [String : Any]? {
        return nil
    }
    
    func request() -> URLRequest {
           guard var components = URLComponents(string: baseUrl) else {
               fatalError("Invalid URL")
           }
           components.path = path

           var request = URLRequest(url: components.url!)
           request.httpMethod = httpMethod.rawValue

           if case let .sendFloorData(id) = self {
               let encoder = JSONEncoder()
               encoder.keyEncodingStrategy = .convertToSnakeCase
               request.httpBody = try? encoder.encode(["key1": id])
               request.setValue("application/json", forHTTPHeaderField: "Content-Type")
           }

           return request
       }
}
