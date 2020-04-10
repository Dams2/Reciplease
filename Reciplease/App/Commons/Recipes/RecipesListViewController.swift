//
//  RecipesListViewController.swift
//  Reciplease
//
//  Created by Damien Rojo on 21.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

final class RecipesListViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var dataSource = RecipesListDataSources()
    
    var recipesListViewModel: RecipesListViewModel!
    
    var favoritesRecipesListViewModel: FavoritesRecipesListViewModel!
        
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!

    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.rowHeight = 160
        tableView.dataSource = dataSource
        tableView.delegate = dataSource

        bind(to: recipesListViewModel)

        recipesListViewModel.viewDidLoad()

        bind(to: dataSource)
    }
    
    // MARK: - Helpers
    
    private func bind(to viewModel: RecipesListViewModel) {
        viewModel.items = { [weak self] items in
            DispatchQueue.main.async {
                self?.dataSource.update(with: items)
                self?.tableView.reloadData()
            }
        }
    }

    private func bind(to dataSource: RecipesListDataSources) {
        dataSource.didSelectItemAtIndex = recipesListViewModel.didSelectItem
    }
}
