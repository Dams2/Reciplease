//
//  Recipes+RecipesResponse.swift
//  Reciplease
//
//  Created by Damien Rojo on 23.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

extension SearchViewModel.Recipes {
    init(response: RecipesResponse) {
        self.ontologyIdentifier = "\(response.hits.first?.recipe.uri)"
        self.title = "\(response.hits.first?.recipe.label)"
        self.image = "\(response.hits.first?.recipe.image)"
        self.sourceSiteIdentifier = "\(response.hits.first?.recipe.source)"
        self.originalRecipeURL = "\(response.hits.first?.recipe.url)"
//        self.totalTime = "\(response.hits.first?.recipe.totalTime)"
        self.numberOfServings = "\(response.hits.first?.recipe.yield)"
        self.cautions = "\(response.hits.first?.recipe.cautions)"
        self.ingredientLines = "\(response.hits.first?.recipe.ingredientLines)"
        self.ingredients = "\(response.hits.first?.recipe.ingredients)"
        self.calories = "\(response.hits.first?.recipe.calories)"
        self.totalWeight = "\(response.hits.first?.recipe.totalWeight)"
    }
}
