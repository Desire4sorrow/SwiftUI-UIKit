//
//  SplashScreenProtocols.swift
//  City Guide
//
//  Created by Omega on 11.08.2022.
//

import Foundation

protocol SplashScreenPresenterInput: AnyObject {

}

protocol SplashScreenViewInput: AnyObject {

}

protocol SplashScreenRouterInput: AnyObject {
    func showMainScreen()
}

protocol SplashScreenRouterOutput: AnyObject {

}
