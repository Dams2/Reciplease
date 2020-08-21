//
//  RecipesListCoordinator.swift
//  Reciplease
//
//  Created by Damien Rojo on 24.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

final class FavoritesCoordinator {
    
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
        showFavorite()
    }

    private func showFavorite() {
        let actions = RecipesListViewModel.Actions(didSelectItem: { recipe in
            self.showDetails(for: recipe)
        })
        let viewController = screens.createFavoritesRecipesListViewController(actions: actions)
        presenter.viewControllers = [viewController]
    }

    private func showDetails(for recipe: Recipe) {
        let viewController = screens.createDetailViewController(for: recipe)
        presenter.pushViewController(viewController, animated: true)
    }
}

