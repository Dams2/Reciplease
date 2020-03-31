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
    
    private let repository: RecipesListRepositoryType

    init(repository: RecipesListRepositoryType) {
        self.repository = repository
    }
    
    private var recipeItems: [RecipeItems] = [] {
        didSet {
            let items = recipeItems.map { Recipes(recipeItems: $0) }
            self.items?(items)
        }
    }
    
    // MARK: - Outputs

    var items: (([Recipes]) -> Void)?

    struct Recipes {
        let ontologyIdentifier: String
        let title: String
        let image: String
        let sourceSiteIdentifier: String
        let originalRecipeURL: String
    //        let totalTime: String
        let numberOfServings: String
        let cautions, ingredientLines: String
        let ingredients: String
        let calories, totalWeight: String
    }
    
    enum RecipeItems {
        case food(response: RecipesResponse)
    }
    // MARK: - Inputs
    
    func viewDidLoad() {
        repository.getRecipes(for: "beef") { (recipesResponse) in
            self.recipeItems.append(.food(response: recipesResponse))
        }
    }
}

extension RecipesListViewModel.Recipes {
    init(recipeItems: RecipesListViewModel.RecipeItems) {
        switch recipeItems {
        case .food(response: let response):
            self = RecipesListViewModel.Recipes(response: response)
        }
    }
}
