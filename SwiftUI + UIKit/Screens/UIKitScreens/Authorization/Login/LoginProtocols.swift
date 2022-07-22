//
//  LoginProtocols.swift
//  City Guide
//
//  Created by Omega on 20.07.2022.
//

import Foundation

protocol LoginPresenterInput: AnyObject {
    func registrationButtonTouched()
    func onLoginTouched(_ email: String, _ password: String)
}

protocol LoginViewInput: AnyObject {

}

protocol LoginRouterInput: ErrorRouter {
    func showRegistrationScreen()
    func showMainScreen(email: String)
}

protocol LoginRouterOutput: AnyObject {

}
