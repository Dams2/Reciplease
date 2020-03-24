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
    
    var items: (([Recipes]) -> Void)?
    
    struct Recipes {
        let ontologyIdentifier: String
        let title: String
        let image: String
        let sourceSiteIdentifier: String
        let originalRecipeURL: String
//        let totalTime: String
        let numberOfServings: String
        let cautions, ingredientLines: String
        let ingredients: String
        let calories, totalWeight: String
    }
    
    // MARK: - Inputs
    
    func viewDidLoad() {
        whatsInYourFridgeText?("What's in your fridge ?")
        searchPlaceholderText?("Lemon, Cheese, Sausages...")
        addText?("Add")
        yourIngredientsText?("Your ingredients :")
        clearText?("Clear")
        ingredientsText?("add ingredients...")
        searchForRecipesText?("Search for recipes")
    
    }
    
    func didPressSearchForRecipes() {
        delegate?.didPressSearch()
    }
}
