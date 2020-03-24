//
//  RecipesResultTableViewCell.swift
//  Reciplease
//
//  Created by Damien Rojo on 24.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

final class RecipesResultTableViewCell: UITableViewCell {
    
    @IBOutlet weak var recipeImageView: UIImageView!
    
    @IBOutlet weak var recipeTitleLabel: UILabel!
    
    @IBOutlet weak var recipeIngredientLinesLabel: UILabel!
    
    func configure(with recipe: SearchViewModel.Recipes) {
        recipeImageView.image = UIImage(named: recipe.image)
        recipeTitleLabel.text = recipe.title
        recipeIngredientLinesLabel.text = recipe.ingredientLines
    }
}
