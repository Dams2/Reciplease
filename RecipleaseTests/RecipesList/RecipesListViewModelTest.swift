//
//  RecipesListViewModelTest.swift
//  RecipleaseTests
//
//  Created by Damien Rojo on 03.09.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import XCTest
@testable import Reciplease

final class RecipesListViewModelTest: XCTestCase {
    
    func testGivenRecipesListViewModel_WhenViewDidLoad_ThenItemsIsEmpty() {
        let ingredients: [String] = []
        let actions = RecipesListViewModel.Actions(didSelectItem: { _ in })
        let searchRepository = MockSearchRecipesListRepository()
        let recipe = Recipe(response: mockRecipesResponse.hits[0].recipe)
        let favoritesRepository = MockFavoriteRecipesListRepository()
        favoritesRepository.recipes = [recipe]
        let viewModel = RecipesListViewModel(ingredientsList: ingredients,
                                             actions: actions,
                                             searchRecipesListRepository: searchRepository,
                                             favoritesRecipesListRepository: favoritesRepository)
        let expectation = self.expectation(description: "Items is empty returned")

        let expectedResult: [Recipe] = [recipe]

        viewModel.items = { item in
            XCTAssertEqual(item, expectedResult)
            expectation.fulfill()
        }
        
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenRecipesListViewModel_WhenViewDidLoad_ThenItemsIsNotEmpty() {
        let ingredients: [String] = ["chicken"]
        let actions = RecipesListViewModel.Actions(didSelectItem: { _ in })
        
        let searchRepository = MockSearchRecipesListRepository()
        searchRepository.response = mockRecipesResponse
        let favoritesRepository = MockFavoriteRecipesListRepository()
        let viewModel = RecipesListViewModel(ingredientsList: ingredients,
                                             actions: actions,
                                             searchRecipesListRepository: searchRepository,
                                             favoritesRecipesListRepository: favoritesRepository)
        let expectation = self.expectation(description: "Items is not empty returned")

        let expectedResult: [Recipe] = [Recipe(title: "Chicken Vesuvio",
                                               imageTextURL: "https://www.edamam.com/web-img/e42/e42f9119813e890af34c259785ae1cfb.jpg",
                                               originalRecipeURL: "http://www.seriouseats.com/recipes/2011/12/chicken-vesuvio-recipe.html",
                                               totalTime: "1h",
                                               ingredientLines: "1/2 cup olive oil\n- 5 cloves garlic, peeled\n- 2 large russet potatoes, peeled and cut into chunks\n- 1 3-4 pound chicken, cut into 8 pieces (or 3 pound chicken legs)\n- 3/4 cup white wine\n- 3/4 cup chicken stock\n- 3 tablespoons chopped parsley\n- 1 tablespoon dried oregano\n- Salt and pepper\n- 1 cup frozen peas, thawed",
                                               url: "http://www.seriouseats.com/recipes/2011/12/chicken-vesuvio-recipe.html"),
                                        Recipe(title: "Chicken Paprikash",
                                               imageTextURL: "https://www.edamam.com/web-img/e12/e12b8c5581226d7639168f41d126f2ff.jpg",
                                               originalRecipeURL: "http://norecipes.com/recipe/chicken-paprikash/",
                                               totalTime: "0m",
                                               ingredientLines: "640 grams chicken - drumsticks and thighs ( 3 whole chicken legs cut apart)\n- 1/2 teaspoon salt\n- 1/4 teaspoon black pepper\n- 1 tablespoon butter – cultured unsalted (or olive oil)\n- 240 grams onion sliced thin (1 large onion)\n- 70 grams Anaheim pepper chopped (1 large pepper)\n- 25 grams paprika (about 1/4 cup)\n- 1 cup chicken stock\n- 1/2 teaspoon salt\n- 1/2 cup sour cream\n- 1 tablespoon flour – all-purpose",
                                               url: "http://norecipes.com/recipe/chicken-paprikash/")]

        var counter = 0
        viewModel.items = { item in
            if counter == 1 {
                XCTAssertEqual(item, expectedResult)
                expectation.fulfill()
            }
            counter += 1
        }
        
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenRecipesListViewModel_WhenDidSelectItem_ThenItemsIsFavorite_IsCorrectyReturned() {
        let ingredients: [String] = []
        let actions = RecipesListViewModel.Actions(didSelectItem: { _ in })
        let searchRepository = MockSearchRecipesListRepository()
        let recipe = [Recipe(response: mockRecipesResponse.hits[0].recipe),Recipe(response: mockRecipesResponse.hits[1].recipe)]
        let favoritesRepository = MockFavoriteRecipesListRepository()
        let viewModel = RecipesListViewModel(ingredientsList: ingredients,
                                             actions: actions,
                                             searchRecipesListRepository: searchRepository,
                                             favoritesRecipesListRepository: favoritesRepository)
    
        let result = viewModel.didSelectItem(at: 1)

    }
}

extension Recipe: Equatable {
    public static func ==(lhs: Recipe, rhs: Recipe) -> Bool {
        return String(describing: lhs) == String(describing: rhs)
    }
}

fileprivate class MockSearchRecipesListRepository: RecipesListRepositoryType {
    
    var response: RecipesResponse!
    
    func getRecipes(for food: String?, callback: @escaping (RecipesResponse) -> Void) {
        callback(response)
    }
}

fileprivate class MockFavoriteRecipesListRepository: FavoritesRecipesListRepositoryType {
    
    var recipes: [Recipe] = []
    
    func getRecipes(for food: String?, callback: @escaping ([Recipe]) -> Void) {
        callback(recipes)
    }
}
