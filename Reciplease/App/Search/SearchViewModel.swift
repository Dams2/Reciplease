//
//  SearchViewModel.swift
//  Reciplease
//
//  Created by Damien Rojo on 21.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

final class SearchViewModel {
    
    // MARK: - Properties

    private weak var delegate: SearchViewControllerDelegate?
    
    init(delegate: SearchViewControllerDelegate?) {
        self.delegate = delegate
    }
    
    // MARK: - Outputs
    
    var whatsInYourFridgeText: ((String) -> Void)?

    var searchPlaceholderText: ((String) -> Void)?

    var addText: ((String) -> Void)?

    var yourIngredientsText: ((String) -> Void)?

    var clearText: ((String) -> Void)?

    var ingredientsText: ((String) -> Void)?

    var searchForRecipesText: ((String) -> Void)?

    var ingredientsList: [String] = [] {
        didSet {
            let text = ingredientsList.map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            ingredientsText?("- \(text.joined(separator: "\n\n- "))")
        }
    }

    // MARK: - Helpers

    private func appendIngredients(searchText: String, ingredients: [String]) {
        let searchTextLowercased = searchText.lowercased()
        
        if searchTextLowercased.isEmpty || ingredients.contains(searchTextLowercased) {
            return
        } else {
            charactersSet(searchTextLowercased: searchTextLowercased)
        }
    }
    
    private func charactersSet(searchTextLowercased: String) {
        if searchTextLowercased.rangeOfCharacter(from: NSCharacterSet.letters.inverted) == nil {
            ingredientsList.append(searchTextLowercased.lowercased())
        } else {
            return
        }
    }

    // MARK: - Inputs

    func viewDidLoad() {
        whatsInYourFridgeText?("What's in your fridge ?")
        searchPlaceholderText?("Lemon, Cheese...")
        addText?("Add")
        yourIngredientsText?("Your ingredients :")
        clearText?("Clear")
        ingredientsText?("add ingredients...")
        searchForRecipesText?("Search for recipes")
    }

    func didPressAdd(searchText: String) {
        appendIngredients(searchText: searchText, ingredients: ingredientsList)
        
        print(ingredientsList)
    }

    func didPressClear() {
        ingredientsList = []
        ingredientsText?("add ingredients...")
    }

    func didPressSearch() {
        delegate?.didPressSearch(ingredientsList: ingredientsList)
    }
}
