//
//  SearchCoordinator.swift
//  Reciplease
//
//  Created by Damien Rojo on 21.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

final class SearchCoordinator {

    // MARK: - Properties

    private let presenter: UINavigationController

    private let screens: Screens

    // MARK: - Initializer

    init(presenter: UINavigationController, screens: Screens) {
        self.presenter = presenter
        self.screens = screens
    }

    // MARK: - Coodinator

    func start() {
        showSearch()
    }

    private func showSearch() {
        let actions = SearchViewModel.Actions { (array) in
            self.showRecipesResult(ingredientsList: array)
        }
        
        let viewController = screens.createSearchViewController(actions: actions)
        presenter.viewControllers = [viewController]
    }

    private func showRecipesResult(ingredientsList: [String]) {
        let actions = RecipesListViewModel.Actions(didSelectItem: { recipe in
            self.showDetails(for: recipe)
        })
        let viewController = screens.createRecipesListViewController(ingredientsList: ingredientsList, actions: actions)
        presenter.pushViewController(viewController, animated: true)
    }

    private func showDetails(for recipe: Recipe) {
        let viewController = screens.createDetailViewController(for: recipe)
        presenter.pushViewController(viewController, animated: true)
    }
}
