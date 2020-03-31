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
    
    private var searchViewController: UIViewController?
    
    
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
    
    fileprivate func showResult() {
        let viewController = screens.createRecipesListViewController()
        presenter.viewControllers = [viewController]
    }
}

extension SearchCoordinator: SearchViewControllerDelegate {
    func didPressSearch() {
        showResult()
    }
}
