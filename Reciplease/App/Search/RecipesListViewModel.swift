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
    
    var viewModel: SearchViewModel!
    
    private let ingredientsList: [String]
    
    private weak var delegate: RecipesListViewControllerDelegate?

    private let repository: RecipesListRepositoryType

    init(ingredientsList: [String], delegate: RecipesListViewControllerDelegate?, repository: RecipesListRepositoryType) {
        self.ingredientsList = ingredientsList
        self.delegate = delegate
        self.repository = repository
    }
    
    private var recipeItems: [RecipeItem] = [] {
        didSet {
            let items = recipeItems.map { Recipe(recipeItems: $0) }
            self.items?(items)
        }
    }

    // MARK: - Outputs

    var items: (([Recipe]) -> Void)?

    enum RecipeItem {
        case food(response: RecipesResponse.Hit)
    }

    // MARK: - Inputs

    func viewDidLoad() {
        print(ingredientsList.joined(separator: "/"))
        repository.getRecipes(for: ingredientsList.joined(separator: "/")) { [weak self] recipesResponse in
            recipesResponse.hits.lazy.forEach { self?.recipeItems.append(.food(response: $0)) }
        }
    }

    func didSelectItem(at index: Int) {
        guard index < recipeItems.count else { return }
        let recip = Recipe(recipeItems: recipeItems[index])
        delegate?.didSelect(recip)
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

