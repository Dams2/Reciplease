//
//  RecipesListTableViewCell.swift
//  Reciplease
//
//  Created by Damien Rojo on 24.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

final class RecipesListTableViewCell: UITableViewCell {
    
    // MARK: - Private Properties

    private var client: HTTPClient!

    private var token: RequestCancellationToken?

    // MARK: - Outlets

    @IBOutlet weak var recipeImageView: UIImageView!
    
    @IBOutlet weak var gradientView: GradientView!
    
    @IBOutlet weak var recipeTitleLabel: UILabel!

    @IBOutlet weak var recipeIngredientLinesLabel: UILabel!

    @IBOutlet weak var infoView: UIView! {
        didSet {
            infoView.layer.borderWidth = 1
            infoView.layer.cornerRadius = 5
            infoView.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    @IBOutlet weak var likesLabel: UILabel!
    
    @IBOutlet weak var likesImageView: UIImageView! {
        didSet {
            likesImageView.image = UIImage(named: "heart")
        }
    }
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var timeImageView: UIImageView! {
        didSet {
            timeImageView.image = UIImage(named: "clock")
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        token = nil
    }

    // MARK: - Action
    
    func configure(with recipe: Recipe) {
        timeLabel.text = recipe.totalTime
        recipeTitleLabel.text = recipe.title
        recipeIngredientLinesLabel.text = recipe.ingredientLines
        token = RequestCancellationToken()
        guard let token = token, let url = URL(string: recipe.imageTextURL) else { return }
        recipeImageView.setImage(url: url,
                                 placeholder: nil,
                                 cancelledBy: token)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupGradientView()
    }

    private func setupGradientView() {
        let endColor = UIColor.black
        let startColor = UIColor.clear
        gradientView.updateGradient(with: .vertical, colors: startColor, endColor)
    }
}
