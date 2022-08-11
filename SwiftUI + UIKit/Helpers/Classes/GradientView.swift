//
//  GradientView.swift
//  City Guide
//
//  Created by Omega on 11.08.2022.
//

import UIKit

final class GradientView: UIView {

    @IBInspectable var startColor: UIColor = .black { didSet { updateColors() }}
    @IBInspectable var endColor: UIColor = .white { didSet { updateColors() }}
    @IBInspectable var startLocation = 0.05 { didSet { updateLocations() }}
    @IBInspectable var endLocation = 0.95 { didSet { updateLocations() }}
    @IBInspectable var horizontalMode = false { didSet { updatePoints() }}
    @IBInspectable var diagonalMode = false { didSet { updatePoints() }}

    override class var layerClass: AnyClass { CAGradientLayer.self }

    var gradientLayer: CAGradientLayer { layer as! CAGradientLayer }

    func updatePoints() {
        if horizontalMode {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 1, y: 0) : CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint = diagonalMode ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0.5)
        } else {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 0, y: 0) : CGPoint(x: 0.5, y: 0)
            gradientLayer.endPoint = diagonalMode ? CGPoint(x: 1, y: 1) : CGPoint(x: 0.5, y: 1)
        }
    }

    func updateLocations() {
        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
    }

    func updateColors() {
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        updatePoints()
        updateLocations()
        updateColors()
    }
}
