//
//  SearchRepository.swift
//  Reciplease
//
//  Created by Damien Rojo on 21.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

protocol SearchRepositoryType: class {
    func getRecipes(callback: @escaping (RecipesResponse) -> Void)
}

protocol HTTPClientType: class {
    func request<T>(type: T.Type,
                    requestType: RequestType,
                    url: URL,
                    cancelledBy token: RequestCancellationToken,
                    completion: @escaping (T) -> Void) where T : Decodable, T : Encodable
}

final class SearchRepository: SearchRepositoryType {
    
    let client: HTTPClientType
        
     let token = RequestCancellationToken()
    
     init(client: HTTPClientType!) {
        self.client = client
     }

    func getRecipes(callback: @escaping (RecipesResponse) -> Void) {
        let stringURL = "https://api.edamam.com/search?q=chicken&app_id=10134b4c&app_key=17290abcde8ff15c43296fb17008d218"
        guard let url = URL(string: stringURL) else { return }
        client.request(type: RecipesResponse.self,
                       requestType: .GET,
                       url: url,
                       cancelledBy: token,
                       completion: { recipesResponse in
                        callback(recipesResponse)
        })
    }
}
