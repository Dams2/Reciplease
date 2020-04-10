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
    
    // MARK: - Outlets
    
    @IBOutlet weak var infoView: UIView!{
        didSet {
            infoView.layer.borderWidth = 1
            infoView.layer.cornerRadius = 5
            infoView.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    @IBOutlet weak var likesLabel: UILabel!
    
    @IBOutlet weak var likesImageView: UIImageView!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var timeImageView: UIImageView!
    
    @IBOutlet weak var recipeImageView: UIImageView! {
        didSet {
            recipeImageView.addGradient()
        }
    }
    
    @IBOutlet weak var recipeTitleLabel: UILabel!
    
    @IBOutlet weak var ingredientsLabel: UILabel!
    
    @IBOutlet weak var ingredientsTextView: UITextView!
    
    @IBOutlet weak var getDirectionsButton: UIButton!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bind(to: viewModel)
        viewModel.viewDidLoad()
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
            self?.recipeImageView.addGradient()
            self?.recipeImageView.setImage(url: url,
                                     placeholder: UIImage(named: "recipleaseImage"),
                                     cancelledBy: nil)
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
    }
    
   
    // MARK: - Inputs
    
    @IBAction func didPressGetDirectionsButton(_ sender: UIButton) {
        guard let url = URL(string: viewModel.didPressGetDirection()) else { return }
        UIApplication.shared.open(url)
    }
}
