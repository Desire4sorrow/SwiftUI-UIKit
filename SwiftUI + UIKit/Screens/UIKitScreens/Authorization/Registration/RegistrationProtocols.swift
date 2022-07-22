//
//  RegistrationProtocols.swift
//  City Guide
//
//  Created by Omega on 20.07.2022.
//

import Foundation

protocol RegistrationPresenterInput: AnyObject {
    func registrationButtonTouched(_ fields: RegistrationViewModel)
}

protocol RegistrationViewInput: AnyObject {
}

protocol RegistrationRouterInput: AnyObject {
    func showError(_ error: Error)
    func showMainScreen(name: String, email: String)
}

protocol RegistrationRouterOutput: AnyObject {

}
