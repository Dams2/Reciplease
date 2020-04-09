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

    private func showDetail(for recipe: Recipe) {
        let viewController = screens.createDetailViewController(for: recipe)
        presenter.viewControllers = [viewController]
    }
}

extension FavoritesCoordinator: RecipesListViewControllerDelegate {
    func didSelect(_ item: Recipe) {
        showDetail(for: item)
    }
}
