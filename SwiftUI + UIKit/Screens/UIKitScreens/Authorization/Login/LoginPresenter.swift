//
//  LoginPresenter.swift
//  City Guide
//
//  Created by Omega on 20.07.2022.
//

import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import Foundation

final class LoginPresenter {
    unowned var view: LoginViewInput!
    var router: LoginRouterInput!
}

// MARK: - LoginPresenterInput

extension LoginPresenter: LoginPresenterInput {

    func registrationButtonTouched() {
        router.showRegistrationScreen()
    }

    func onLoginTouched(_ email: String, _ password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { _ , error in
            if error != nil {
                self.router.showError(error!)
            } else {
                self.router.showMainScreen(email: email)
            }
        }
    }
}

// MARK: - LoginOutput

extension LoginPresenter: LoginRouterOutput {

}
