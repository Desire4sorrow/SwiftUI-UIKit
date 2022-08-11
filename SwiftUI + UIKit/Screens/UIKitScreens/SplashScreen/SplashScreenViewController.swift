//
//  SplashScreenViewController.swift
//  City Guide
//
//  Created by Omega on 11.08.2022.
//

import UIKit

final class SplashScreenViewController: UIViewController {

    @IBOutlet var gradientView: GradientView!

    @IBOutlet weak var guidLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!

    static let logoImageBig = UIImage(named: "splash-icon")!

    var logoIsHidden = false

    override func viewDidLoad() {
        logoImageView.isHidden = logoIsHidden
    }
}
