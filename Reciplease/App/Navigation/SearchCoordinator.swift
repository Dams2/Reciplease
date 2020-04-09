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
        let viewController = screens.createSearchViewController(delegate: self)
        presenter.viewControllers = [viewController]
    }
    
    private func showRecipesResult() {
        let viewController = screens.createRecipesListViewController(delegate: self)
        presenter.pushViewController(viewController, animated: true)
    }

    private func showDetails(for recipe: Recipe) {
        let viewController = screens.createDetailViewController(for: recipe)
        presenter.pushViewController(viewController, animated: true)
    }
}

extension SearchCoordinator: SearchViewControllerDelegate {
    func didPressSearch() {
        showRecipesResult()
    }
}

extension SearchCoordinator: RecipesListViewControllerDelegate {
    func didSelect(_ recipe: Recipe) {
        showDetails(for: recipe)
    }
}


