//
//  MainScreenPresenter.swift
//  SwiftUI + UIKit
//
//  Created by Omega on 15.06.2022.
//

import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import Foundation

final class MainScreenPresenter {
    unowned var view: MainScreenViewInput!
    var router: MainScreenRouterInput!

    var isRegistration = false
    var handle: AuthStateDidChangeListenerHandle?

    var name = ""
    var email = ""

    init(isRegistration: Bool, name: String, email: String) {
        self.isRegistration = isRegistration
        self.name = name
        self.email = email
    }

    func handleLogoutEvent() {
        email = ""
        view.makeUserView()
    }
}

// MARK: - MainScreenPresenterInput

extension MainScreenPresenter: MainScreenPresenterInput {

    func viewDidLoad() {
        if isRegistration {
            router.showWelcomeAlert(name: name)
        }
    }

    func viewWillAppear() {
        handle = Auth.auth().addStateDidChangeListener { _ , user in
            if let user = user {
                self.email = user.email!
            }
        }
    }

    func cityChanged() {
        postNotification(.cityChanged)
    }

    func onLoginTouched() {
        router.showLoginScreen()
    }

    func onExitTouched() {
        do {
            try Auth.auth().signOut()
            handleLogoutEvent()
        } catch {
            router.showError(error)
        }

    }
}

// MARK: - MainScreenOutput

extension MainScreenPresenter: MainScreenRouterOutput {}
