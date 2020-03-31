//
//  RecipesListDataSources.swift
//  Reciplease
//
//  Created by Damien Rojo on 24.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

final class RecipesListDataSources: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    typealias Item = RecipesListViewModel.Recipes
    
    private var items: [Item] = []

    func update(with item: [Item]) {
        self.items = item
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard items.count > indexPath.item else {
            return UITableViewCell()
        }
        
        let recipe = items[indexPath.item]
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipesListTableViewCell", for: indexPath) as! RecipesListTableViewCell
        cell.configure(with: recipe)
        return cell
    }
}
