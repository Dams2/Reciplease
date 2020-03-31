//
//  RecipesListTableViewCell.swift
//  Reciplease
//
//  Created by Damien Rojo on 24.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

final class RecipesListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var recipeImageView: UIImageView!
    
    @IBOutlet weak var recipeTitleLabel: UILabel!
    
    @IBOutlet weak var recipeIngredientLinesLabel: UILabel!
    
    @IBOutlet weak var View: UIView!
    
    func configure(with recipe: RecipesListViewModel.Recipes) {
        convertImage(with: recipe)
        recipeTitleLabel.text = recipe.title
        recipeIngredientLinesLabel.text = recipe.ingredientLines
    }
    
    private func convertImage(with recipe: RecipesListViewModel.Recipes) {
        if let url = URL(string: recipe.image) {
            do {
                let data = try Data(contentsOf: url)
                recipeImageView.image = UIImage(data: data)
            } catch let error {
                print("ERROR \(error.localizedDescription)")
            }
        }
    }
    
//    private func makePictureConstraints(for image: UIImageView, with view: UIView ) {
//        image.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            image.leftAnchor.constraint(equalTo: view.leftAnchor),
//            image.rightAnchor.constraint(equalTo: view.rightAnchor),
//            image.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            image.topAnchor.constraint(equalTo: view.topAnchor)
//        ])
//    }
}
