//
//  SearchViewModel.swift
//  Reciplease
//
//  Created by Damien Rojo on 21.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

final class SearchViewModel {
    
    // MARK: - Private Properties
    
    private var ingredientsList: [String] = [] {
        didSet {
            var text = ingredientsList
            text = text.filter({ $0 != "" })
            text.removeDuplicates()
            ingredientsText?("- \(text.joined(separator: "\n\n- "))")
        }
    }
    private let actions: Actions
        
    struct Actions {
        let didPressSearch: ([String]) -> Void
    }
    
    // MARK: - Init
    
    init(
        actions: Actions
    ) {
        self.actions = actions
    }
    
    // MARK: - Outputs
    
    var whatsInYourFridgeText: InputClosure<String>?

    var searchPlaceholderText: InputClosure<String>?

    var addText: InputClosure<String>?

    var yourIngredientsText: InputClosure<String>?

    var clearText: InputClosure<String>?

    var ingredientsText: InputClosure<String>?

    var searchForRecipesText: InputClosure<String>?

    // MARK: - Inputs

    func viewDidLoad() {
        whatsInYourFridgeText?("What's in your fridge ?")
        searchPlaceholderText?("Lemon, Cheese...")
        addText?("Add")
        yourIngredientsText?("Your ingredients :")
        clearText?(" Clear ")
        ingredientsText?("add ingredients...")
        searchForRecipesText?("Search for recipes")
    }

    func didPressAdd(searchText: String) {
        let array = searchText.stripped.replacingOccurrences(of: " ", with: ",").lowercased().components(separatedBy: ",")
        
        array.forEach { ingredientsList.append($0.trimmingCharacters(in: .whitespacesAndNewlines)) }
    }

    func didPressClear() {
        ingredientsList = []
        ingredientsText?("add ingredients...")
    }

    func didPressSearchForRecipes() {
        if ingredientsList.isEmpty {
            return
        } else {
            actions.didPressSearch(ingredientsList)
        }
    }
}
