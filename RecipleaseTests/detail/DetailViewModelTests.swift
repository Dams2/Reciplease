//
//  DetailViewModelTests.swift
//  RecipleaseTests
//
//  Created by Damien Rojo on 10.04.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import XCTest
@testable import Reciplease

final class DetailViewModelTests: XCTestCase {
    
    func testGivenDetailViewModel_WhenViewDidLoad_ThenLikesImageText_IsCorretlyReturned() {
        let recipe = Recipe(title: "Hot dog",
                            imageTextURL: "https://www.edamam.com/web-img/916/916cfbfecd2cec42aef45990560e06df.jpg",
                            originalRecipeURL: "http://www.edamam.com/ontologies/edamam.owl#recipe_d98b124d8df7b4fabc4bbd99ce686229",
                            totalTime: "15m",
                            ingredientLines: "saussage, ketchup",
                            url: "http://nymag.com/restaurants/articles/recipes/bloodorangemimosa.htm")
        let stack = CoredataStack()
        let repository = FavoritesRecipesListRepository(stack: stack)
        let viewModel = DetailViewModel(recipe: recipe,
                                        favoritesRecipesListRepository: repository)
        let expectation = self.expectation(description: "Likes image text returned")
        
        viewModel.likesImageText = { text in
            XCTAssertEqual(text, "heart")
            expectation.fulfill()
        }
        
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenDetailViewModel_WhenViewDidLoad_ThenTimerText_IsCorretlyReturned() {
        let recipe = Recipe(title: "Hot dog",
        imageTextURL: "https://www.edamam.com/web-img/916/916cfbfecd2cec42aef45990560e06df.jpg",
        originalRecipeURL: "http://www.edamam.com/ontologies/edamam.owl#recipe_d98b124d8df7b4fabc4bbd99ce686229",
        totalTime: "15m",
        ingredientLines: "saussage, ketchup",
        url: "http://nymag.com/restaurants/articles/recipes/bloodorangemimosa.htm")
        let stack = CoredataStack()
        let repository = FavoritesRecipesListRepository(stack: stack)
        let viewModel = DetailViewModel(recipe: recipe,
                                        favoritesRecipesListRepository: repository)
        let expectation = self.expectation(description: "Timer text returned")
        
        viewModel.timerText = { text in
            XCTAssertEqual(text, recipe.totalTime)
            expectation.fulfill()
        }
        
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenDetailViewModel_WhenViewDidLoad_ThenTimerImageText_IsCorretlyReturned() {
        let recipe = Recipe(title: "Hot dog",
        imageTextURL: "https://www.edamam.com/web-img/916/916cfbfecd2cec42aef45990560e06df.jpg",
        originalRecipeURL: "http://www.edamam.com/ontologies/edamam.owl#recipe_d98b124d8df7b4fabc4bbd99ce686229",
        totalTime: "15m",
        ingredientLines: "saussage, ketchup",
        url: "http://nymag.com/restaurants/articles/recipes/bloodorangemimosa.htm")
        let stack = CoredataStack()
        let repository = FavoritesRecipesListRepository(stack: stack)
        let viewModel = DetailViewModel(recipe: recipe,
                                        favoritesRecipesListRepository: repository)
        let expectation = self.expectation(description: "Timer image text returned")
        
        viewModel.timerImageText = { text in
            XCTAssertEqual(text, "clock")
            expectation.fulfill()
        }
        
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenDetailViewModel_WhenViewDidLoad_ThenRecipeImageText_IsCorretlyReturned() {
        let recipe = Recipe(title: "Hot dog",
        imageTextURL: "https://www.edamam.com/web-img/916/916cfbfecd2cec42aef45990560e06df.jpg",
        originalRecipeURL: "http://www.edamam.com/ontologies/edamam.owl#recipe_d98b124d8df7b4fabc4bbd99ce686229",
        totalTime: "15m",
        ingredientLines: "saussage, ketchup",
        url: "http://nymag.com/restaurants/articles/recipes/bloodorangemimosa.htm")
        let stack = CoredataStack()
        let repository = FavoritesRecipesListRepository(stack: stack)
        let viewModel = DetailViewModel(recipe: recipe,
                                        favoritesRecipesListRepository: repository)
        let expectation = self.expectation(description: "Recipe image text returned")
        
        viewModel.recipeImageText = { text in
            XCTAssertEqual(text, recipe.imageTextURL)
            expectation.fulfill()
        }
        
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenDetailViewModel_WhenViewDidLoad_ThenRecipeTitleText_IsCorretlyReturned() {
        let recipe = Recipe(title: "Hot dog",
        imageTextURL: "https://www.edamam.com/web-img/916/916cfbfecd2cec42aef45990560e06df.jpg",
        originalRecipeURL: "http://www.edamam.com/ontologies/edamam.owl#recipe_d98b124d8df7b4fabc4bbd99ce686229",
        totalTime: "15m",
        ingredientLines: "saussage, ketchup",
        url: "http://nymag.com/restaurants/articles/recipes/bloodorangemimosa.htm")
        let stack = CoredataStack()
        let repository = FavoritesRecipesListRepository(stack: stack)
        let viewModel = DetailViewModel(recipe: recipe,
                                        favoritesRecipesListRepository: repository)
        let expectation = self.expectation(description: "Recipe title text returned")
        
        viewModel.recipeTitleText = { text in
            XCTAssertEqual(text, recipe.title)
            expectation.fulfill()
        }
        
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenDetailViewModel_WhenViewDidLoad_ThenIngredientsText_IsCorretlyReturned() {
        let recipe = Recipe(title: "Hot dog",
        imageTextURL: "https://www.edamam.com/web-img/916/916cfbfecd2cec42aef45990560e06df.jpg",
        originalRecipeURL: "http://www.edamam.com/ontologies/edamam.owl#recipe_d98b124d8df7b4fabc4bbd99ce686229",
        totalTime: "15m",
        ingredientLines: "saussage, ketchup",
        url: "http://nymag.com/restaurants/articles/recipes/bloodorangemimosa.htm")
        let stack = CoredataStack()
        let repository = FavoritesRecipesListRepository(stack: stack)
        let viewModel = DetailViewModel(recipe: recipe,
                                        favoritesRecipesListRepository: repository)
        let expectation = self.expectation(description: "Ingredients text returned")
        
        viewModel.ingredientsText = { text in
            XCTAssertEqual(text, "Ingredients :")
            expectation.fulfill()
        }
        
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenDetailViewModel_WhenViewDidLoad_ThenIngredientsListText_IsCorretlyReturned() {
        let recipe = Recipe(title: "Hot dog",
        imageTextURL: "https://www.edamam.com/web-img/916/916cfbfecd2cec42aef45990560e06df.jpg",
        originalRecipeURL: "http://www.edamam.com/ontologies/edamam.owl#recipe_d98b124d8df7b4fabc4bbd99ce686229",
        totalTime: "15m",
        ingredientLines: "saussage, ketchup",
        url: "http://nymag.com/restaurants/articles/recipes/bloodorangemimosa.htm")
        let stack = CoredataStack()
        let repository = FavoritesRecipesListRepository(stack: stack)
        let viewModel = DetailViewModel(recipe: recipe,
                                        favoritesRecipesListRepository: repository)
        let expectation = self.expectation(description: "Ingredients list text returned")
        
        viewModel.ingredientsListText = { text in
            XCTAssertEqual(text, "- \(recipe.ingredientLines)")
            expectation.fulfill()
        }
        
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenDetailViewModel_WhenViewDidLoad_ThenGetDirectionsText_IsCorretlyReturned() {
        let recipe = Recipe(title: "Hot dog",
        imageTextURL: "https://www.edamam.com/web-img/916/916cfbfecd2cec42aef45990560e06df.jpg",
        originalRecipeURL: "http://www.edamam.com/ontologies/edamam.owl#recipe_d98b124d8df7b4fabc4bbd99ce686229",
        totalTime: "15m",
        ingredientLines: "saussage, ketchup",
        url: "http://nymag.com/restaurants/articles/recipes/bloodorangemimosa.htm")
        let stack = CoredataStack()
        let repository = FavoritesRecipesListRepository(stack: stack)
        let viewModel = DetailViewModel(recipe: recipe,
                                        favoritesRecipesListRepository: repository)
        let expectation = self.expectation(description: "Get directions  text returned")
        
        viewModel.getDirectionsText = { text in
            XCTAssertEqual(text, "Get Directions")
            expectation.fulfill()
        }
        
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenDetailViewModel_WhenDidPressAddToFavorite_ThenRecipeIsAlreadyFavorite_IsCorretlyReturned() {
        let recipe = Recipe(title: "Roast Sirloin Of Beef",
        imageTextURL: "https://www.edamam.com/web-img/d37/d376c145f2a59befa7738a2c35caab31.jpg",
        originalRecipeURL: "http://www.bbcgoodfood.com/recipes/2558/",
        totalTime: "0m",
        ingredientLines: "400.0g can beef consommé, 1-1.5kg/2lb 4-3lb 5oz sirloin of beef joint, 2.0 tbsp vegetable oil or beef fat, 1 glass red wine",
        url: "http://www.bbcgoodfood.com/recipes/2558/")
        let stack = CoredataStack()
        let repository = FavoritesRecipesListRepository(stack: stack)
        let viewModel = DetailViewModel(recipe: recipe,
                                        favoritesRecipesListRepository: repository)
        let expectation = self.expectation(description: "did press add to favorite if is already favorite returned")

        var counter = 0
        viewModel.favoriteState = { state in
            if counter == 1 {
                XCTAssertEqual(state, true)
                expectation.fulfill()
            }
            counter += 1
        }
        
        viewModel.viewDidLoad()
        viewModel.didPressAddToFavorite()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenDetailViewModel_WhenDidPressAddToFavorite_ThenRecipeIsNotFavorite_IsCorretlyReturned() {
        let recipe = Recipe(title: "Strong Cheese",
        imageTextURL: "https://www.edamam.com/web-img/53c/53ca837dcd939671920e6ab70ad723a6.jpg",
        originalRecipeURL: "http://notwithoutsalt.com/strong-cheese/",
        totalTime: "0m",
        ingredientLines: "1 lb left-over cheese, at room temperature, 1/4 cup dry white wine, 3 tbsp unsalted butter, softened, 2 tbsp fresh parsley leaves, 1 small clove garlic",
        url: "http://notwithoutsalt.com/strong-cheese/")
        let stack = CoredataStack()
        let repository = FavoritesRecipesListRepository(stack: stack)
        let viewModel = DetailViewModel(recipe: recipe,
                                        favoritesRecipesListRepository: repository)
        let expectation = self.expectation(description: "did press add to favorite if is not favorite returned")

        var counter = 0
        viewModel.favoriteState = { state in
            if counter == 1 {
                XCTAssertEqual(state, false)
                expectation.fulfill()
            }
            counter += 1
        }
        
        viewModel.viewDidLoad()
        viewModel.didPressAddToFavorite()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenDetailViewModel_WhenGetDirection_ThenOriginalRecipeURL_IsCorrectlyReturned() {
        let recipe = Recipe(title: "Hot dog",
        imageTextURL: "https://www.edamam.com/web-img/916/916cfbfecd2cec42aef45990560e06df.jpg",
        originalRecipeURL: "http://www.edamam.com/ontologies/edamam.owl#recipe_d98b124d8df7b4fabc4bbd99ce686229",
        totalTime: "15m",
        ingredientLines: "saussage, ketchup",
        url: "http://www.saveur.com/article/Recipes/Barbecued-Beef-Brisket/")
        let stack = CoredataStack()
        let repository = FavoritesRecipesListRepository(stack: stack)
        let viewModel = DetailViewModel(recipe: recipe,
                                        favoritesRecipesListRepository: repository)
        
        let result = viewModel.didPressGetDirection()
        XCTAssertEqual(result, recipe.originalRecipeURL)
    }
}
