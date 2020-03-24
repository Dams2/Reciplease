//
//  RecipeViewController.swift
//  Reciplease
//
//  Created by Damien Rojo on 21.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

final class RecipesResultViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var dataSource = RecipesResultDataSources()
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
    }
    
    // MARK: - Actions
    
    
}
