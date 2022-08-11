//
//  SplashScreenViewController.swift
//  City Guide
//
//  Created by Omega on 11.08.2022.
//

import UIKit

final class SplashScreenViewController: UIViewController {
    var presenter: SplashScreenPresenterInput!

    @IBOutlet var gradientView: GradientView!

    override func viewDidLoad() {

    }
}

extension SplashScreenViewController: SplashScreenViewInput {

}
