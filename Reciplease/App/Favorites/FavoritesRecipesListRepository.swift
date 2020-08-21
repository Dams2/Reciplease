//
//  FavoritesRecipesListRepository.swift
//  Reciplease
//
//  Created by Damien Rojo on 09.04.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

final class FavoritesRecipesListRepository {

    private let stack: CoredataStack

    init(stack: CoredataStack) {
         self.stack = stack
     }

    func getRecipes(for food: String?, callback: @escaping ([Recipe]) -> Void) {
        let set = QuerySet<RecipeEntity>(context: stack.context)
        let result = set.all
        callback(result.compactMap { Recipe(entity: $0) })
    }
    
    func saveRecipe(for recipe: Recipe) {
        if stack.someEntityExists(id: recipe.url) == false {
            stack.saveContext(for: recipe)
        } else {
            print("This object already exist")
        }
    }
    
    func deleteRecipe(for recipe: Recipe, id: String) {
        if stack.someEntityExists(id: recipe.url) == true {
            stack.deleteContext(id: id)
        } else {
            print("This object doesn't exist")
        }
    }

    func isAlreadyFavorite(id: String) -> Bool {
        return stack.someEntityExists(id: id)
    }
}

extension Recipe {
    init?(entity: RecipeEntity) {
        guard
            let title = entity.title,
            let imageTextURL = entity.imageURL,
            let totalTime = entity.totalTime,
            let ingredientLines = entity.ingredients,
            let originalRecipeURL = entity.url,
            let url = entity.id
            else { return nil }
        self.title = title
        self.imageTextURL = imageTextURL
        self.totalTime = totalTime
        self.ingredientLines = ingredientLines
        self.originalRecipeURL = originalRecipeURL
        self.url = url
    }
}
