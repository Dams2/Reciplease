//
//  DetailViewModel.swift
//  Reciplease
//
//  Created by Damien Rojo on 31.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

final class DetailViewModel {
    
    // MARK: - Properties
    
    private let recipe: Recipe
    private let favoritesRecipesListRepository: FavoritesRecipesListRepository
    private var counter = 0

    private var isFavorite = false {
        didSet {
            favoriteState?(isFavorite)
        }
    }

    // MARK: - Init
        
    init(
        recipe: Recipe,
        favoritesRecipesListRepository: FavoritesRecipesListRepository
    ) {
        self.recipe = recipe
        self.favoritesRecipesListRepository = favoritesRecipesListRepository
    }
    
    // MARK: - Outputs
    
    var likesText: ((String) -> Void)?
    var likesImageText: ((String) -> Void)?
    var timerText: ((String) -> Void)?
    var timerImageText: ((String) -> Void)?
    var recipeImageText: ((String) -> Void)?
    var recipeTitleText: ((String) -> Void)?
    var ingredientsText: ((String) -> Void)?
    var ingredientsListText: ((String) -> Void)?
    var getDirectionsText: ((String) -> Void)?
    var favoriteState: ((Bool) -> Void)?
    
    // MARK: - Inputs
    
    func viewDidLoad() {
        likesImageText?("heart")
        timerText?(recipe.totalTime)
        timerImageText?("clock")
        recipeImageText?(recipe.imageTextURL)
        recipeTitleText?(recipe.title)
        ingredientsText?("Ingredients :")
        ingredientsListText?("- \(recipe.ingredientLines)")
        getDirectionsText?("Get Directions")
        isFavorite = favoritesRecipesListRepository.isAlreadyFavorite(id: recipe.url)
    }
    
    func didPressAddToFavorite() {
        isFavorite = !isFavorite
        favoritesRecipesListRepository.saveRecipe(for: recipe)
    }
    
//    func didPressGetDirection() -> String {
//        return recipe.originalRecipeURL
//    }
}
