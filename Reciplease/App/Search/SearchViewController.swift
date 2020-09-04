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
    
    @IBOutlet weak private var whatsInYourFridgeLabel: UILabel?
    
    @IBOutlet weak private var addButton: UIButton?
    
    @IBOutlet weak private var searchBar: UISearchBar! {
        didSet {
            searchBar.searchTextField.backgroundColor = .white
            searchBar.keyboardType = .alphabet
        }
    }
    
    @IBOutlet weak private var yourIngredientLabel: UILabel!
    
    @IBOutlet weak private var clearButton: UIButton! {
        didSet {
            clearButton.layer.borderWidth = 1
            clearButton.layer.cornerRadius = 5
        }
    }
    
    @IBOutlet weak private var ingredientsTextView: UITextView!
    
    @IBOutlet weak private var searchForRecipesButton: UIButton!
    
    // MARK: - Properties
    
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
        viewModel.whatsInYourFridgeText = { [weak self] text in
            DispatchQueue.main.async {
                self?.whatsInYourFridgeLabel?.text = text
            }
        }
        
        viewModel.searchPlaceholderText = { [weak self] placeholder in
            DispatchQueue.main.async {
                self?.searchBar.placeholder = placeholder
            }
        }
        
        viewModel.addText = { [weak self] text in
            DispatchQueue.main.async {
                self?.addButton?.setTitle(text, for: .normal)
            }
        }
        
        viewModel.yourIngredientsText = {[weak self] text in
            DispatchQueue.main.async {
                self?.yourIngredientLabel.text = text
            }
        }
        
        viewModel.clearText = { [weak self] text in
            DispatchQueue.main.async {
                self?.clearButton?.setTitle(text, for: .normal)
            }
        }
        
        viewModel.ingredientsText = { [weak self] text in
            DispatchQueue.main.async {
                self?.ingredientsTextView.text = text
            }
        }
    }
    
    // MARK: - Actions
    
    @IBAction private func didPressAddButton(_ sender: UIButton) {
        guard let searchText = searchBar.text else { return }
        
        viewModel.didPressAdd(searchText: searchText)
        searchBar.text = ""
    }
    
    @IBAction private func didPressClearButton(_ sender: UIButton) {
        viewModel.didPressClear()
    }
    
    @IBAction private func didPressSearchButton(_ sender: UIButton) {
        viewModel.didPressSearchForRecipes()
    }
}
