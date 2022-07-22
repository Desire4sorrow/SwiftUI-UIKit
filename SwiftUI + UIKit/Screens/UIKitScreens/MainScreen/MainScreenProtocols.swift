//
//  MainScreenProtocols.swift
//  SwiftUI + UIKit
//
//  Created by Omega on 15.06.2022.
//

import Foundation

protocol MainScreenPresenterInput: AnyObject {
    var name: String { get }
    var email: String { get }
    func cityChanged()
    func onLoginTouched()
    func viewDidLoad()
}

protocol MainScreenViewInput: AnyObject {}

protocol MainScreenRouterInput: AnyObject {
    func showLoginScreen()
    func showWelcomeAlert(name: String)
}

protocol MainScreenRouterOutput: AnyObject {}
