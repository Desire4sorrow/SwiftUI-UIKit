//
//  LoginRouter.swift
//  City Guide
//
//  Created by Omega on 20.07.2022.
//

import UIKit

final class LoginRouter {
    unowned var view: UIViewController!
    unowned var presenter: LoginRouterOutput!
}

extension LoginRouter: LoginRouterInput {

    func showRegistrationScreen() {
        view.show(RegistrationConfigurator.configure(), sender: nil)
    }

    func showMainScreen(email: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let nav = UINavigationController(rootViewController: MainScreenConfigurator.configure(email: email))
        appDelegate.window!.rootViewController = nav
    }
}
