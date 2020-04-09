//
//  FavoritesRecipesListRepository.swift
//  Reciplease
//
//  Created by Damien Rojo on 09.04.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

final class FavoritesRecipesListRepository {
    
    var stack: CoredataStack
    
    init(stack: CoredataStack) {
         self.stack = stack
     }
}
