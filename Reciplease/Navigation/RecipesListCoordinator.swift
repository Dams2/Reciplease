//
//  RecipesListCoordinator.swift
//  Reciplease
//
//  Created by Damien Rojo on 24.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

final class RecipesListCoordinator {
    
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
        showRecipesResult()
    }

    private func showRecipesResult() {
        let viewController = screens.createRecipesListViewController(delegate: self)
        presenter.viewControllers = [viewController]
     }
    
    private func showDetail() {
        let viewController = screens.createDetailViewController()
        presenter.viewControllers = [viewController]
    }
}

extension RecipesListCoordinator: RecipesListViewControllerDelegate {
    func didPressDetail() {
        showDetail()
    }
}
