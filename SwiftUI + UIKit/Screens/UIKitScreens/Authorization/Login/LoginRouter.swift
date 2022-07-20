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
}
