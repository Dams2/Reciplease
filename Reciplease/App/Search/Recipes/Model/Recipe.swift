//
//  Recipe.swift
//  Reciplease
//
//  Created by Damien Rojo on 09.04.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

struct Recipe {
    let ontologyIdentifier: String
    let title: String
    let imageTextURL: String
    let sourceSiteIdentifier: String
    let originalRecipeURL: String
    let totalTime: String
    let numberOfServings: String
    let ingredientLines: String
    let ingredients: String
    let calories, totalWeight: String
}
