//
//  Recipes+RecipesResponse.swift
//  Reciplease
//
//  Created by Damien Rojo on 23.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

extension Recipe {
    init(response: RecipesResponse.Recipe) {
        self.title = "\(response.label)"
        self.imageTextURL = "\(response.image)"
        self.originalRecipeURL = "\(response.url)"
        self.totalTime = "\(TimeFormatter.hourOrMinuteFormat(time: response.totalTime))"
        self.ingredientLines = "\(response.ingredientLines.joined(separator: "\n- "))"
        self.url = "\(response.url)"
    }
}
