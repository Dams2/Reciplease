//
//  RecipesListRepositoryType.swift
//  Reciplease
//
//  Created by Damien Rojo on 16.04.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

protocol RecipesListRepositoryType: class {
    func getRecipes(for food: String?, callback: @escaping (RecipesResponse) -> Void)
}
