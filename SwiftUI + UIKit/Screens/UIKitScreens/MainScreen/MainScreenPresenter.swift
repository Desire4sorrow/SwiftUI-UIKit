//
//  MainScreenPresenter.swift
//  SwiftUI + UIKit
//
//  Created by Omega on 15.06.2022.
//

import Foundation

final class MainScreenPresenter {
    unowned var view: MainScreenViewInput!
    var router: MainScreenRouterInput!

    var isRegistration = false

    var name = ""
    var email = ""

    init(isRegistration: Bool, name: String, email: String) {
        self.isRegistration = isRegistration
        self.name = name
        self.email = email
    }
}

// MARK: - MainScreenPresenterInput

extension MainScreenPresenter: MainScreenPresenterInput {

    func viewDidLoad() {
        if isRegistration {
            router.showWelcomeAlert(name: name)
        }
    }

    func cityChanged() {
        postNotification(.cityChanged)
    }

    func onLoginTouched() {
        router.showLoginScreen()
    }
}

// MARK: - MainScreenOutput

extension MainScreenPresenter: MainScreenRouterOutput {}
