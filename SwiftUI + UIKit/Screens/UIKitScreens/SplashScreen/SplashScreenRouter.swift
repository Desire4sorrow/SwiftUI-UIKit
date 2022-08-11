//
//  SplashScreenRouter.swift
//  City Guide
//
//  Created by Omega on 11.08.2022.
//

import UIKit

final class SplashScreenRouter {
    unowned var view: UIViewController!
    unowned var presenter: SplashScreenRouterOutput!
}

extension SplashScreenRouter: SplashScreenRouterInput {

    func showMainScreen() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let nav = UINavigationController(rootViewController: MainScreenConfigurator.configure())
        appDelegate.window!.rootViewController = nav
    }
}
