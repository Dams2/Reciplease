//
//  ScreensTests.swift
//  RecipleaseTests
//
//  Created by Damien Rojo on 01.04.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import XCTest
@testable import Reciplease

final class ScreensTests: XCTestCase {

    var screens: Screens! = nil

    var context: Context! = nil

    override func setUp() {
        context = Context()
        screens = Screens(context: context)
    }

    func testThatCreateSearchViewControllerCorrectly() {
        let viewController = screens.createSearchViewController(delegate: nil)
        XCTAssertNotNil(viewController)
    }

    func testThatCreateRecipesListViewControllerCorrectly() {

        let action = RecipesListViewModel.Actions(didSelectItem: { _ in })
        
        let viewController = screens.createRecipesListViewController(ingredientsList: ["chicken"], actions: action)
        XCTAssertNotNil(viewController)
    }
    
    func testThatCreateFavoritesRecipesListViewControllerCorrectly() {
        let action = RecipesListViewModel.Actions(didSelectItem: { _ in })
        
        let viewController = screens.createFavoritesRecipesListViewController(actions: action)
        XCTAssertNotNil(viewController)
    }
    
    func testThatCreateDetailViewControllerCorrectly() {
        let recipe = Recipe(response: mockRecipesResponse.hits[0].recipe)
        let viewController = screens.createDetailViewController(for: recipe)
        XCTAssertNotNil(viewController)
    }
}
