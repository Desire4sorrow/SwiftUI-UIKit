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
    func viewWillAppear()
    func onExitTouched()
}

protocol MainScreenViewInput: AnyObject {
    func makeUserView()
}

protocol MainScreenRouterInput: ErrorRouter {
    func showLoginScreen()
    func showWelcomeAlert(name: String)
}

protocol MainScreenRouterOutput: AnyObject {}
