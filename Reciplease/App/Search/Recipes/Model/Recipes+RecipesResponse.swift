//
//  Recipes+RecipesResponse.swift
//  Reciplease
//
//  Created by Damien Rojo on 23.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

extension Recipe {
    init(response: RecipesResponse.Hit) {
        self.ontologyIdentifier = "\(response.recipe.uri)"
        self.title = "\(response.recipe.label)"
        self.imageTextURL = "\(response.recipe.image)"
        self.sourceSiteIdentifier = "\(response.recipe.source)"
        self.originalRecipeURL = "\(response.recipe.url)"
        self.totalTime = "\(TimeFormatter.hourOrMinuteFormat(time: response.recipe.totalTime))"
        self.numberOfServings = "\(response.recipe.yield)"
        self.cautions = "\(response.recipe.cautions)"
        self.ingredientLines = "\(response.recipe.ingredientLines.joined(separator: ", "))"
        self.ingredients = "\(response.recipe.ingredients)"
        self.calories = "\(response.recipe.calories)"
        self.totalWeight = "\(response.recipe.totalWeight)"
    }
}
