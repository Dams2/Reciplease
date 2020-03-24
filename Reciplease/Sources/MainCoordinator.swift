//
//  MainCoordinator.swift
//  Reciplease
//
//  Created by Damien Rojo on 20.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

enum ViewControllerItem: Int {
    case search = 0
    case favorite = 1
}

protocol TabBarSourceType {
    var items: [UINavigationController] { get set }
}

extension TabBarSourceType {
    subscript(item: ViewControllerItem) -> UINavigationController {
        get {
            guard !items.isEmpty, item.rawValue < items.count, item.rawValue >= 0 else {
                fatalError("Item does not exists")
            }
            return items[item.rawValue]
        }
    }
}

fileprivate class TabBarSource: TabBarSourceType {
    var items: [UINavigationController] = [
        UINavigationController(nibName: nil, bundle: nil),
        UINavigationController(nibName: nil, bundle: nil)
    ]

    init() {
        self[.search].tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        self[.favorite].tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
    }
}

final class MainCoordinator: NSObject {

    // MARK: - Properties
    
    private let presenter: UIWindow

    private let tabBarController: UITabBarController

    private let screens: Screens
    
    private var searchCoordinator: SearchCoordinator?

    private var favoriteCoordinator: FavoriteCoordinator?
    
    private var recipesResultCoordinator: RecipesResultCoordinator?
    
    private var tabBarSource = TabBarSource()

    // MARK: - Init

    init(presenter: UIWindow, context: Context) {
        self.presenter = presenter

        screens = Screens(context: context)

        tabBarController = UITabBarController(nibName: nil, bundle: nil)
        tabBarController.viewControllers = tabBarSource.items
        tabBarController.selectedViewController = tabBarSource[.search]

        super.init()

        tabBarController.delegate = self
    }

    // MARK: - Coordinator

    func start() {
        presenter.rootViewController = tabBarController
        showSearch()
    }

    private func showSearch() {
        searchCoordinator = SearchCoordinator(presenter: tabBarSource[.search], screens: screens)
        searchCoordinator?.start()
    }
    
   private func showFavorite() {
        favoriteCoordinator = FavoriteCoordinator(presenter: tabBarSource[.favorite], screens: screens)
        favoriteCoordinator?.start()
    }
    
}

extension MainCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let index = tabBarController.selectedIndex
        guard index < tabBarSource.items.count, let item = ViewControllerItem(rawValue: index) else {
            fatalError("Selected ViewController Index Out Of range")
        }

        switch item {
        case .search:
            showSearch()
        case .favorite:
            showFavorite()
        }
    }
}
