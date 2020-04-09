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
    
    private let helper = Helper()
    
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
    
    @IBOutlet weak var recipeImageView: UIImageView!
    
    @IBOutlet weak var recipeTitleLabel: UILabel!
    
    @IBOutlet weak var ingredientsLabel: UILabel!
    
    @IBOutlet weak var ingredientsTextView: UITextView!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind(to: viewModel)
        viewModel.viewDidLoad()
    }
    
    // MARK: - Helpers
    
    private func bind(to viewModel: DetailViewModel) {
        viewModel.likesText = { [weak self] text in
            self?.likesImageView.image = UIImage(named: text)
        }
        
        viewModel.timerText = { [weak self] text in
            self?.timeImageView.image = UIImage(named: text)
        }
    }
    
   
    // MARK: - Inputs
    
    
}
