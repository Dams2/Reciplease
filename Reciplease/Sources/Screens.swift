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

protocol SearchViewControllerDelegate: class {
    func didPressSearch()
}

extension Screens {
    func createSearchViewController(delegate: SearchViewControllerDelegate?) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        let viewModel = SearchViewModel(delegate: delegate)
        viewController.viewModel = viewModel
        return viewController
    }
}

extension Screens {
    func createFavoriteViewController() -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "FavoriteViewController") as! FavoriteViewController
        return viewController
    }
}

extension Screens {
    func createRecipesListViewController() -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "RecipesListViewController") as! RecipesListViewController
        let repository = RecipesListRepository(client: context.client)
        let viewModel = RecipesListViewModel(repository: repository)
        viewController.viewModel = viewModel
        return viewController
    }
}
