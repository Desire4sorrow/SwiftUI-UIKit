//
//  LoginProtocols.swift
//  City Guide
//
//  Created by Omega on 20.07.2022.
//

import Foundation

protocol LoginPresenterInput: AnyObject {
    func registrationButtonTouched()
}

protocol LoginViewInput: AnyObject {

}

protocol LoginRouterInput: AnyObject {
    func showRegistrationScreen()
}

protocol LoginRouterOutput: AnyObject {

}
