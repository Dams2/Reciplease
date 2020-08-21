//
//  GradientView.swift
//  Reciplease
//
//  Created by Damien Rojo on 16.04.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

final class GradientView: UIView {
    lazy var gradientLayer = layer as? LinearGradientLayer

    override class var layerClass: AnyClass {
        return LinearGradientLayer.self
    }

    func updateGradient(with direction: LinearGradientLayer.Direction, colors: UIColor...) {
        gradientLayer?.direction = direction
        gradientLayer?.colors = colors.map { $0.cgColor}
        gradientLayer?.setNeedsDisplay()
    }
}
