//
//  ImageProvider.swift
//  Reciplease
//
//  Created by Damien Rojo on 08.04.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func addGradient() {
        let view = UIView(frame: self.frame)
        let gradient = CAGradientLayer()

        gradient.frame = view.frame
        gradient.colors = [gradient, UIColor.black.cgColor]
        gradient.locations = [0.5, 1]

        view.layer.insertSublayer(gradient, at: 0)

        self.addSubview(view)
        self.bringSubviewToFront(view)
    }
}

extension UIImageView {

    func setImage(url: URL, placeholder: UIImage? = nil, cancelledBy token: RequestCancellationToken?) {
        if let placeholder = placeholder {
            self.image = placeholder
        }

        ImageRepository.shared.getImage(for: url) { response in
            DispatchQueue.main.async {
                guard let data = response else { return }
                self.image = UIImage(data: data)
            }
        }
    }
}
