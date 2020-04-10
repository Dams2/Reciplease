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
        let viewController = screens.createRecipesListViewController(delegate: nil)
        XCTAssertNotNil(viewController)
    }
    
//    func testThatCreateDetailViewControllerCorrectly() {
//        let viewController = screens.createDetailViewController()
//        XCTAssertNotNil(viewController)
//    }
}
