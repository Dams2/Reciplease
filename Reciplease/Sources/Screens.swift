//
//  Screens.swift
//  Reciplease
//
//  Created by Damien Rojo on 20.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

public class Screens {
    
    let context: Context

    let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: Screens.self))

    init(context: Context) {
       self.context = context
    }
}

protocol SearchViewControllerDelegate: class {
    func didPressSearch(ingredientsList: [String])
}

extension Screens {
    func createSearchViewController(delegate: SearchViewControllerDelegate?) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        let viewModel = SearchViewModel(delegate: delegate)
        viewController.viewModel = viewModel
        return viewController
    }
}

protocol RecipesListViewControllerDelegate: class {
    func didSelect(_ recipe: Recipe)
}

extension Screens {
    func createRecipesListViewController(ingredientsList: [String], delegate: RecipesListViewControllerDelegate?) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "RecipesListViewController") as! RecipesListViewController
        let repository = RecipesListRepository(client: context.client)
        let viewModel = RecipesListViewModel(ingredientsList: ingredientsList, delegate: delegate, repository: repository)
        viewController.recipesListViewModel = viewModel
        return viewController
    }
}

extension Screens {
    func createFavoritesRecipesListViewController() -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "RecipesListViewController") as! RecipesListViewController
        let repository = FavoritesRecipesListRepository(stack: context.stack)
        let viewModel = FavoritesRecipesListViewModel(repository: repository)
        viewController.favoritesRecipesListViewModel = viewModel
        return viewController
    }
}

extension Screens {
    func createDetailViewController(for recipe: Recipe) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        let viewModel = DetailViewModel(recipe: recipe)
        viewController.viewModel = viewModel
        return viewController
    }
}
