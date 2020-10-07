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

extension Screens {
    func createSearchViewController(
        actions: SearchViewModel.Actions
    ) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        let viewModel = SearchViewModel(actions: actions)
        viewController.viewModel = viewModel
        return viewController
    }
}

extension Screens {
    func createRecipesListViewController(ingredientsList: [String],
                                         actions: RecipesListViewModel.Actions) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "RecipesListViewController") as! RecipesListViewController
        let searchRecipesListRepository = SearchRecipesListRepository(client: context.client)
        let favoritesRecipesListRepository = FavoritesRecipesListRepository(stack: context.stack)
        let viewModel = RecipesListViewModel(ingredientsList: ingredientsList,
                                             actions: actions,
                                             searchRecipesListRepository: searchRecipesListRepository,
                                             favoritesRecipesListRepository: favoritesRecipesListRepository)
        viewController.viewModel = viewModel
        return viewController
    }
}

extension Screens {
    func createFavoritesRecipesListViewController(actions: RecipesListViewModel.Actions) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "RecipesListViewController") as! RecipesListViewController
        let searchRecipesListRepository = SearchRecipesListRepository(client: context.client)
        let favoritesRecipesListRepository = FavoritesRecipesListRepository(stack: context.stack)
        let viewModel = RecipesListViewModel(ingredientsList: [],
                                             actions: actions,
                                             searchRecipesListRepository: searchRecipesListRepository,
                                             favoritesRecipesListRepository: favoritesRecipesListRepository)
        viewController.viewModel = viewModel
        return viewController
    }
}

extension Screens {
    func createDetailViewController(for recipe: Recipe) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        let favoritesRecipesListRepository = FavoritesRecipesListRepository(stack: context.stack)
        
        let viewModel = DetailViewModel(recipe: recipe, favoritesRecipesListRepository: favoritesRecipesListRepository)
        viewController.viewModel = viewModel
        return viewController
    }
}
