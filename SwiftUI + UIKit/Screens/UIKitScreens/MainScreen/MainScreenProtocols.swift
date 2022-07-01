//
//  MainScreenProtocols.swift
//  SwiftUI + UIKit
//
//  Created by Omega on 15.06.2022.
//

import Foundation

protocol MainScreenPresenterInput: AnyObject {
    func cityChanged()
}

protocol MainScreenViewInput: AnyObject {}

protocol MainScreenRouterInput: AnyObject {}

protocol MainScreenRouterOutput: AnyObject {}
