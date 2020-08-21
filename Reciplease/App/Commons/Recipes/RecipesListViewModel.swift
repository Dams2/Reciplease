//
//  RecipesListViewModel.swift
//  Reciplease
//
//  Created by Damien Rojo on 21.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

final class RecipesListViewModel {

    // MARK: - Properties
    
    private let ingredientsList: [String]
    private let searchRecipesListRepository: SearchRecipesListRepository
    private let favoritesRecipesListRepository: FavoritesRecipesListRepository

    private let actions: Actions
    struct Actions {
        let didSelectItem: (Recipe) -> Void
    }

    init(
        ingredientsList: [String],
        actions: Actions,
        searchRecipesListRepository: SearchRecipesListRepository,
        favoritesRecipesListRepository: FavoritesRecipesListRepository
    ) {
        self.ingredientsList = ingredientsList
        self.actions = actions
        self.searchRecipesListRepository = searchRecipesListRepository
        self.favoritesRecipesListRepository = favoritesRecipesListRepository
    }
    
    private var recipeItems: [RecipeItem] = [] {
        didSet {
            let items = recipeItems.map { Recipe(recipeItems: $0) }
            self.items?(items)
        }
    }

    private var favoriteRecipes: [Recipe] = [] {
        didSet {
            self.items?(favoriteRecipes)
        }
    }

    // MARK: - Outputs

    var items: (([Recipe]) -> Void)?

    enum RecipeItem {
        case food(response: RecipesResponse.Recipe)
    }
    
    // MARK: - Helpers

    // MARK: - Inputs

    func viewDidLoad() {
        if !ingredientsList.isEmpty {
            searchRecipesListRepository.getRecipes(for: ingredientsList.joined(separator: "/")) { [weak self] recipesResponse in
                recipesResponse.hits.lazy.forEach { self?.recipeItems.append(.food(response: $0.recipe)) }
            }
        } else {
            favoritesRecipesListRepository.getRecipes(for: nil) { (recipes) in
                self.favoriteRecipes = recipes
            }
        }
    }

    func didSelectItem(at index: Int) {
        guard favoriteRecipes.indices.contains(index) else { return }
        let recip = Recipe(recipeItems: recipeItems[index])
        actions.didSelectItem(recip)
    }
}

extension Recipe {
    init(recipeItems: RecipesListViewModel.RecipeItem) {
        switch recipeItems {
        case .food(response: let response):
            self = Recipe(response: response)
        }
    }
}
