// 
//  MainScreenPresenter.swift
//  SwiftUI + UIKit
//
//  Created by Omega on 15.06.2022.
//

import Foundation

final class MainScreenPresenter {
    unowned var view: MainScreenViewInput!
    var router: MainScreenRouterInput!
}

// MARK: - MainScreenPresenterInput

extension MainScreenPresenter: MainScreenPresenterInput {
    func cityChanged() {
        postNotification(.cityChanged)
    }
}

// MARK: - MainScreenOutput

extension MainScreenPresenter: MainScreenRouterOutput {
    
}
