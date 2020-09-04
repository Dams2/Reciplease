//
//  SearchRecipesListRepositoryTests.swift
//  RecipleaseTests
//
//  Created by Damien Rojo on 01.04.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import XCTest
@testable import Reciplease

final class SearchRecipesListRepositoryTests: XCTestCase {
    
    func testGivenRecipesListRepository_WhenGetRecipes_IsCorrectlyReturned() {
        let expectedResponse = mockRecipesResponse
        let mockClient = MockHTTPClientType()
        mockClient.result = mockRecipesResponse
        
        let repository = SearchRecipesListRepository(client: mockClient)
        
        let expectation = self.expectation(description: "Response Return")
        
        repository.getRecipes(for: "chicken", callback: { result in
            XCTAssertEqual(result, expectedResponse)
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}

final class MockHTTPClientType: HTTPClientType {
    
    var result: RecipesResponse!
    
    func request<T: Codable>(type: T.Type,
                    requestType: RequestType,
                    url: URL,
                    cancelledBy token: RequestCancellationToken,
                    completion: @escaping (T) -> Void) {
        guard let result = result as? T else { return }
        completion(result)
    }
}
