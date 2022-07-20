//
//  MainScreenProtocols.swift
//  SwiftUI + UIKit
//
//  Created by Omega on 15.06.2022.
//

import Foundation

protocol MainScreenPresenterInput: AnyObject {
    func cityChanged()
    func onLoginTouched()
}

protocol MainScreenViewInput: AnyObject {}

protocol MainScreenRouterInput: AnyObject {
    func showLoginScreen()
}

protocol MainScreenRouterOutput: AnyObject {}
