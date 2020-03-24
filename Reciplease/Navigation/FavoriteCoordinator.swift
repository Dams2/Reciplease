//
//  FavoriteCoordinator.swift
//  Reciplease
//
//  Created by Damien Rojo on 21.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

final class FavoriteCoordinator {
    
    // MARK: - Properties
    
     private let presenter: UINavigationController

     private let screens: Screens
    
    private var favoriteViewController: UIViewController?


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
        let viewController = screens.createFavoriteViewController()
        presenter.viewControllers = [viewController]
     }
}
