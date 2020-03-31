//
//  DetailViewController.swift
//  Reciplease
//
//  Created by Damien Rojo on 31.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var recipeImageView: UIImageView!
    
    @IBOutlet weak var recipeTitleLabel: UILabel!
    

    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func configure(with recipe: RecipesListViewModel.Recipes) {
        convertImage(with: recipe)
        recipeTitleLabel.text = recipe.title
    }
       
    func convertImage(with recipe: RecipesListViewModel.Recipes) {
       if let url = URL(string: recipe.image) {
           do {
               let data = try Data(contentsOf: url)
               recipeImageView.image = UIImage(data: data)
           } catch let error {
               print("ERROR \(error.localizedDescription)")
           }
       }
    }
    
    // MARK: - Inputs
    
    
}
