//
//  SplashScreenPresenter.swift
//  City Guide
//
//  Created by Omega on 11.08.2022.
//

import Foundation

final class SplashScreenPresenter {
    unowned var view: SplashScreenViewInput!
    var router: SplashScreenRouterInput!
}

// MARK: - SplashScreenPresenterInput

extension SplashScreenPresenter: SplashScreenPresenterInput {

}

// MARK: - SplashScreenOutput

extension SplashScreenPresenter: SplashScreenRouterOutput {

}
