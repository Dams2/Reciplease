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
    
    var viewModel: RecipesListViewModel!
            
    // MARK: - Outlets
    
    @IBOutlet weak private var tableView: UITableView!

    @IBOutlet weak private var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak private var noFavoritesLabel: UILabel!
    
    // MARK: - View life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        self.tableView.rowHeight = 160
        tableView.dataSource = dataSource
        tableView.delegate = dataSource

        bind(to: viewModel)

        viewModel.viewDidLoad()

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
        
        viewModel.dataIsLoaded = { [weak self] state in
            DispatchQueue.main.async {
                switch state {
                case false:
                    self?.tableView.isHidden = true
                    self?.activityIndicator.startAnimating()
                case true:
                    self?.activityIndicator.stopAnimating()
                    self?.tableView.isHidden = false
                }
            }
        }
        
        viewModel.recipesArrayIsEmpty = { [weak self] state in
            DispatchQueue.main.async {
                switch state {
                case true:
                    self?.tableView.isHidden = true
                    self?.noFavoritesLabel.isHidden = false
                case false:
                    self?.tableView.isHidden = false
                    self?.noFavoritesLabel.isHidden = true
                }
            }
        }
    }

    private func bind(to dataSource: RecipesListDataSources) {
        dataSource.didSelectItemAtIndex = viewModel.didSelectItem
    }
}
