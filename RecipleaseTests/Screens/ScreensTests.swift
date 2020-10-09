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

    private var screens: Screens! = nil
    private var context: Context! = nil
    private var actions: SearchViewModel.Actions!

    override func setUp() {
        context = Context()
        screens = Screens(context: context)
        actions = .init(didPressSearch: { (ingredients) in
            
        })
    }

    func testThatCreateSearchViewControllerCorrectly() {
        let viewController = screens.createSearchViewController(actions: actions)
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
