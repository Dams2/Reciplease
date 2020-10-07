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
    
    var likesText: InputClosure<String>?
    var likesImageText: InputClosure<String>?
    var timerText: InputClosure<String>?
    var timerImageText: InputClosure<String>?
    var recipeImageText: InputClosure<String>?
    var recipeTitleText: InputClosure<String>?
    var ingredientsText: InputClosure<String>?
    var ingredientsListText: InputClosure<String>?
    var getDirectionsText: InputClosure<String>?
    var favoriteState: InputClosure<Bool>?
    
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
        print(recipe.title)
        print(recipe.imageTextURL)
        print(recipe.originalRecipeURL)
        print(recipe.totalTime)
        print(recipe.ingredientLines)
        print(recipe.url)
    }
    
    func didPressAddToFavorite() {
        if isFavorite == false {
            AddToFavorite()
        } else if isFavorite == true {
            deleteFromFavorite()
        }
    }
    
    func didPressGetDirection() -> String {
        return recipe.originalRecipeURL
    }
    
    // MARK: - Helpers
    
    private func AddToFavorite() {
        isFavorite = !isFavorite
        favoritesRecipesListRepository.saveRecipe(for: recipe)
    }
    
    private func deleteFromFavorite() {
        isFavorite = false
        favoritesRecipesListRepository.deleteRecipe(for: recipe, id: recipe.url)
    }
}
