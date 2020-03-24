//
//  RecipesResultDataSources.swift
//  Reciplease
//
//  Created by Damien Rojo on 24.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

final class RecipesResultDataSources: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    typealias Item = SearchViewModel.Recipes
    
    private var items: [Item] = []

    func update(with items: [Item]) {
        self.items = items
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard items.count > indexPath.item else {
            return UITableViewCell()
        }

        let recipe = items[indexPath.item]
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipesResultTableViewCell", for: indexPath) as! RecipesResultTableViewCell
        cell.configure(with: recipe)
        return cell
    }
}
