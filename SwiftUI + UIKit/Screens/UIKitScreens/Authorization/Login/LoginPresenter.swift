//
//  LoginPresenter.swift
//  City Guide
//
//  Created by Omega on 20.07.2022.
//

import Foundation

final class LoginPresenter {
    unowned var view: LoginViewInput!
    var router: LoginRouterInput!
}

// MARK: - LoginPresenterInput

extension LoginPresenter: LoginPresenterInput {

}

// MARK: - LoginOutput

extension LoginPresenter: LoginRouterOutput {

}
