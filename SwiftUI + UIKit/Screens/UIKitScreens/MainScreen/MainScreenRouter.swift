//
//  MainScreenRouter.swift
//  SwiftUI + UIKit
//
//  Created by Omega on 15.06.2022.
//

import UIKit

final class MainScreenRouter {
    unowned var view: UIViewController!
    unowned var presenter: MainScreenRouterOutput!
}

extension MainScreenRouter: MainScreenRouterInput {

    func showLoginScreen() {
        view.show(LoginConfigurator.configure(), sender: nil)
    }

    func showWelcomeAlert(name: String) {
        view.or_showAlert(
            title: "Поздравляем!",
            message: "Уважаемый \(name), Вы успешно зарегистрированы!",
            buttonTitle: "Понятно",
            animated: true
        )
    }
}
