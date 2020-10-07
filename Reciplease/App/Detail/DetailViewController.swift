//
//  DetailViewController.swift
//  Reciplease
//
//  Created by Damien Rojo on 31.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
    
    // MARK: - Private Properties
    
    var viewModel: DetailViewModel!
    
    private var token: RequestCancellationToken?
    
    private let gradient = GradientView()

    private lazy var addToFavoriteBarButtonitem: UIBarButtonItem = {
        let addToFavorite = UIBarButtonItem(image: UIImage(systemName: "hand.thumbsup"),
                                            style: .done, target: self, action: #selector(saveRecipe))
        addToFavorite.tintColor = .black
        return addToFavorite
    }()

    // MARK: - Outlets
    
    @IBOutlet weak private var infoView: UIView!{
        didSet {
            infoView.layer.borderWidth = 1
            infoView.layer.cornerRadius = 5
            infoView.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    @IBOutlet weak private var likesLabel: UILabel!
    
    @IBOutlet weak private var likesImageView: UIImageView!
    
    @IBOutlet weak private var timeLabel: UILabel!
    
    @IBOutlet weak private var timeImageView: UIImageView!
    
    @IBOutlet weak private var recipeImageView: UIImageView!
    
    @IBOutlet weak private var gradientView: GradientView!
    
    @IBOutlet weak private var recipeTitleLabel: UILabel!
    
    @IBOutlet weak private var ingredientsLabel: UILabel!
    
    @IBOutlet weak private var ingredientsTextView: UITextView!
    
    @IBOutlet weak private var getDirectionsButton: UIButton!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bind(to: viewModel)
        viewModel.viewDidLoad()
        layoutSubviews()
        setUI()
    }

    private func setUI() {
        navigationItem.setRightBarButton(addToFavoriteBarButtonitem,
                                         animated: true)
    }
    
    private func layoutSubviews() {
        setupGradientView()
    }

    private func setupGradientView() {
        let endColor = UIColor.black
        let startColor = UIColor.clear
        gradientView.updateGradient(with: .vertical, colors: startColor, endColor)
    }
    
    // MARK: - Helpers
    
    private func bind(to viewModel: DetailViewModel) {
        viewModel.likesImageText = { [weak self] text in
            self?.likesImageView.image = UIImage(named: text)
        }
        
        viewModel.timerText = { [weak self] text in
            self?.timeLabel.text = text
        }
        
        viewModel.timerImageText = { [weak self] text in
            self?.timeImageView.image = UIImage(named: text)
        }
        
        viewModel.recipeImageText = { [weak self] text in
            guard let url = URL(string: text) else { return }
            DispatchQueue.main.async {
                self?.recipeImageView.setImage(url: url,
                                         placeholder: UIImage(named: "recipleaseImage"),
                                         cancelledBy: nil)
            }
        }
        
        viewModel.recipeTitleText = { [weak self] text in
            self?.recipeTitleLabel.text = text
        }
        
        viewModel.ingredientsText = { [weak self] text in
            self?.ingredientsLabel.text = text
        }
        
        viewModel.ingredientsListText = { [weak self] text in
            self?.ingredientsTextView.text = text
        }
        
        viewModel.getDirectionsText = { [weak self] text in
            self?.getDirectionsButton.setTitle(text, for: .normal)
        }

        viewModel.favoriteState = { [weak self] state in
            switch state {
            case true:
                self?.addToFavoriteBarButtonitem.tintColor = .blue
            case false:
                self?.addToFavoriteBarButtonitem.tintColor = .black
            }
        }
    }

    // MARK: - Inputs
    
    @IBAction private func didPressGetDirectionsButton(_ sender: UIButton) {
        guard let url = URL(string: viewModel.didPressGetDirection()) else { return }
        UIApplication.shared.open(url)
    }
    
    @objc private func saveRecipe() {
        viewModel.didPressAddToFavorite()
    }
}
