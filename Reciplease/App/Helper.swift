//
//  Helper.swift
//  Reciplease
//
//  Created by Damien Rojo on 02.04.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

final class Helper {
    
    func convertImage(imageView: UIImageView, recipe: Recipe) {
        if let url = URL(string: recipe.imageTextURL) {
            do {
                let data = try Data(contentsOf: url)
                imageView.image = UIImage(data: data)
            } catch let error {
                print("ERROR \(error.localizedDescription)")
            }
        }
    }
    
}
