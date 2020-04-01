//
//  SearchViewController.swift
//  Reciplease
//
//  Created by Damien Rojo on 20.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

final class SearchViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var whatsInYourFridgeLabel: UILabel?
    
    @IBOutlet weak var addButton: UIButton? 
    
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet {
            searchBar.searchTextField.backgroundColor = .white
        }
    }
    
    @IBOutlet weak var yourIngredientLabel: UILabel!
    
    @IBOutlet weak var clearButton: UIButton!
    
    @IBOutlet weak var ingredientsTextView: UITextView!
    
    @IBOutlet weak var searchForRecipesButton: UIButton!
    
    // MARK: - Private Properties
    
    var viewModel: SearchViewModel!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        bind(to: viewModel)
        
        viewModel.viewDidLoad()
    }

    // MARK: - Helpers
    
    private func bind(to viewModel: SearchViewModel) {
        viewModel.whatsInYourFridgeText = { text in
            self.whatsInYourFridgeLabel?.text = text
        }
        
        viewModel.searchPlaceholderText = { placeholder in
            self.searchBar.placeholder = placeholder
        }
        
        viewModel.addText = { text in
            self.addButton?.setTitle(text, for: .normal)
        }
        
        viewModel.yourIngredientsText = { text in
            self.yourIngredientLabel.text = text
        }
        
        viewModel.clearText = { text in
            self.clearButton?.setTitle(text, for: .normal)
        }
        
        viewModel.ingredientsText = { text in
            self.ingredientsTextView.text = text
        }
    }
    
    // MARK: - Actions
    
    @IBAction func didPressAddButton(_ sender: UIButton) {
        guard let searchText = searchBar.text else { return }
        viewModel.didPressAdd(searchText: searchText)
        searchBar.text = ""
    }
    
    @IBAction func didPressClearButton(_ sender: UIButton) {
        viewModel.didPressClear()
    }
    
    @IBAction func didPressSearchButton(_ sender: UIButton) {
        viewModel.didPressSearch()
    }
}
