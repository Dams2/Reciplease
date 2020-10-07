//
//  SearchViewModelTests.swift
//  RecipleaseTests
//
//  Created by Damien Rojo on 31.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import XCTest
@testable import Reciplease

final class SearchViewModelTests: XCTestCase {

    func testGivenSearchViewModel_WhenViewDidLoad_ThenWhatsInYourFridgeText_IsCorrectlyReturned() {
        let viewModel = SearchViewModel(delegate: delegate)
        let expectation = self.expectation(description: "Whats In Your Fridge Text Returned")

        viewModel.whatsInYourFridgeText = { text in
            XCTAssertEqual(text, "What's in your fridge ?")
            expectation.fulfill()
        }

        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testGivenSearchViewModel_WhenViewDidLoad_ThenSearchPlaceholderText_IsCorrectlyReturned() {
        let viewModel = SearchViewModel(delegate: delegate)
        let expectation = self.expectation(description: "Search Placeholder Text Returned")

        viewModel.searchPlaceholderText = { text in
            XCTAssertEqual(text, "Lemon, Cheese...")
            expectation.fulfill()
        }

        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testGivenSearchViewModel_WhenViewDidLoad_ThenAddText_IsCorrectlyReturned() {
        let viewModel = SearchViewModel(delegate: delegate)
        let expectation = self.expectation(description: "Add Text Returned")

        viewModel.addText = { text in
            XCTAssertEqual(text, "Add")
            expectation.fulfill()
        }

        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testGivenSearchViewModel_WhenViewDidLoad_ThenYourIngredientsText_IsCorrectlyReturned() {
        let viewModel = SearchViewModel(delegate: delegate)
        let expectation = self.expectation(description: "Your Ingredients Text Returned")

        viewModel.yourIngredientsText = { text in
            XCTAssertEqual(text, "Your ingredients :")
            expectation.fulfill()
        }

        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testGivenSearchViewModel_WhenViewDidLoad_ThenClearText_IsCorrectlyReturned() {
        let viewModel = SearchViewModel(delegate: delegate)
        let expectation = self.expectation(description: "Clear Text Returned")

        viewModel.clearText = { text in
            XCTAssertEqual(text, "Clear")
            expectation.fulfill()
        }

        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testGivenSearchViewModel_WhenViewDidLoad_ThenIngredientsText_IsCorrectlyReturned() {
        let viewModel = SearchViewModel(delegate: delegate)
        let expectation = self.expectation(description: "Ingredients Text Returned")

        viewModel.ingredientsText = { text in
            XCTAssertEqual(text, "add ingredients...")
            expectation.fulfill()
        }

        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testGivenSearchViewModel_WhenViewDidLoad_ThenSearchForRecipesText_IsCorrectlyReturned() {
        let viewModel = SearchViewModel(delegate: delegate)
        let expectation = self.expectation(description: "Search For Recipes Text Returned")

        viewModel.searchForRecipesText = { text in
            XCTAssertEqual(text, "Search for recipes")
            expectation.fulfill()
        }

        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testGivenSearchViewModel_WhenDidPressClear_ThenIngredientsText_IsCorrectlyReturned() {
        let viewModel = SearchViewModel(delegate: delegate)
        let expectation = self.expectation(description: "Ingredients Text Returned")

        var counter = 0
        viewModel.ingredientsText = { text in
            if counter == 2 {
                XCTAssertEqual(text, "add ingredients...")
                expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressClear()
        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testGivenSearchViewModel_WhenDidAdd_ThenIngredientsText_IsCorrectlyReturned() {
        let viewModel = SearchViewModel(delegate: delegate)
        let expectation = self.expectation(description: "Ingredients Text Returned")

        var counter = 0
        viewModel.ingredientsText = { text in
            if counter == 2 {
                XCTAssertEqual(text, "- chicken")
                expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressAdd(searchText: "chicken,")
        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testGivenSearchViewModel_WhenDidPressSearch_ThenIngredientsTextIsEmpty() {
        let viewModel = SearchViewModel(delegate: delegate)
        let ingredients: [String] = []


    }

    func testGivenSearchViewModel_WhenDidPressSearch_ThenIngredientsTextIsNotEmpty() {
        let viewModel = SearchViewModel()
        let expectation = self.expectation(description: "Ingredients Text is empty Returned")
        var ingredients = ["saussage"]


        XCTAssertEqual(, delegate.didPressSearch(ingredientsList: ingredients))
    }
}
