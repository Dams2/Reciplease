//
//  RecipesListTableViewCell.swift
//  Reciplease
//
//  Created by Damien Rojo on 24.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

final class RecipesListTableViewCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet weak var recipeImageView: UIImageView!

    @IBOutlet weak var recipeTitleLabel: UILabel!

    @IBOutlet weak var recipeIngredientLinesLabel: UILabel!

    @IBOutlet weak var view: UIView! {
        didSet {
            view.layer.borderWidth = 1
            view.layer.cornerRadius = 5
            view.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    @IBOutlet weak var likesLabel: UILabel!
    
    @IBOutlet weak var likesImageView: UIImageView!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var timeImageView: UIImageView!
    
    // MARK: - Actions
    
    func configure(with recipe: RecipesListViewModel.Recipes) {
        convertImage(with: recipe)
        timeLabel.text = recipe.totalTime
        recipeTitleLabel.text = recipe.title
        recipeIngredientLinesLabel.text = recipe.ingredientLines
        addGradient()
    }

    // MARK: - Helpers
    
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

    private func addGradient() {
        let view = UIView(frame: recipeImageView.frame)
        let gradient = CAGradientLayer()

        gradient.frame = view.frame
        gradient.colors = [gradient, UIColor.black.cgColor]
        gradient.locations = [0.0, 1]

        view.layer.insertSublayer(gradient, at: 0)

        recipeImageView.addSubview(view)
        recipeImageView.bringSubviewToFront(view)
    }
}
