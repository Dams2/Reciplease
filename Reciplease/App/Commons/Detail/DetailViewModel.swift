//
//  DetailViewModel.swift
//  Reciplease
//
//  Created by Damien Rojo on 31.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

final class DetailViewModel {
    
    // MARK: - Properties
    
    let recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    // MARK: - Outputs
    
    var likesText: ((String) -> Void)?
    
    var timerText: ((String) -> Void)?
    
    // MARK: - Inputs
    
    func viewDidLoad() {
        likesText?("heart")
        timerText?("clock")
    }
    
}
