//
//  DetailCoordinator.swift
//  Reciplease
//
//  Created by Damien Rojo on 31.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

final class DetailCoordinator {

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
        showDetail()
    }

    private func showDetail() {
        let viewController = screens.createDetailViewController()
        presenter.viewControllers = [viewController]
     }
}
