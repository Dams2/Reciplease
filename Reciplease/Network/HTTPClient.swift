//
//  HTTPClient.swift
//  Reciplease
//
//  Created by Damien Rojo on 20.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

enum RequestType: String {
    case GET = "GET"
    case POST = "POST"
}

final class HTTPClient: HTTPClientType {

    private let engine: HTTPEngine

    private let jsonDecoder: JSONDecoder

    init(engine: HTTPEngine) {
        self.engine = engine
        self.jsonDecoder = JSONDecoder()
    }

    func request<T>(type: T.Type,
                    requestType: RequestType,
                    url: URL,
                    cancelledBy token: RequestCancellationToken,
                    completion: @escaping (T) -> Void) where T: Codable {
        var request = URLRequest(url: url)
        request.httpMethod = requestType.rawValue

        engine.send(request: request, cancelledBy: token, callback: { data, _, _ in
            guard let data = data else { return }
            self.decodeJSON(type: T.self, data: data, completion: completion)
        })
    }

    func dataRequest(requestType: RequestType,
                     url: URL,
                     cancelledBy token: RequestCancellationToken,
                     completion: @escaping (Data) -> Void) {
        
        var request = URLRequest(url: url)
        request.httpMethod = requestType.rawValue
        
        engine.send(request: request, cancelledBy: token) { data, _, _ in
            guard let data = data else { return }
            completion(data)
        }
    }

    private func decodeJSON<T>(type: T.Type, data: Data, completion: @escaping (T) -> Void) where T: Codable {
        guard let decodedData = try? jsonDecoder.decode(type.self, from: data) else {
            print("Decoder was unable to decode: \(type.self)")
            return
        }
        completion(decodedData)
    }
}
