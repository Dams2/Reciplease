//
//  RecipesListRepositoryTests.swift
//  RecipleaseTests
//
//  Created by Damien Rojo on 01.04.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import XCTest
@testable import Reciplease

final class RecipesListRepositoryTests: XCTestCase {
    
    func testGivenRecipesListRepository_WhenGetRecipes_IsCorrectlyReturned() {
        let expectedResponse = RecipesResponse(q: "chicken", from: 0, to: 10, more: true, count: 6200, hits: [Hit(recipe: Recipe(uri: "", label: "", image: "", source: "", url: "", shareAs: "", yield: 11, dietLabels: [""], healthLabels: [HealthLabel.alcoholFree], cautions: [""], ingredientLines: [""], ingredients: [Ingredient(text: "", weight: 12.0)], calories: 12.0, totalWeight: 12.0, totalTime: 1, totalNutrients: ["" : Total(label: "", quantity: 12, unit: Unit(rawValue: "kcal")!)], totalDaily: ["" : Total(label: "", quantity: 12.0, unit: Unit(rawValue: "kcal")!)], digest: [Digest(label: "", tag: "", schemaOrgTag: SchemaOrgTag?(.carbohydrateContent), total: 12.0, hasRDI: true, daily: 12.0, unit: Unit(rawValue: "kcal")!, sub: nil)]), bookmarked: true, bought: true)])
        
        let mockClient = MockHTTPClientType()
        mockClient.result = expectedResponse
        
        let repository = RecipesListRepository(client: mockClient)
        
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
