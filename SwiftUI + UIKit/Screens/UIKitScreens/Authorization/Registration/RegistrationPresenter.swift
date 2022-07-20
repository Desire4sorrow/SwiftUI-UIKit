// 
//  RegistrationPresenter.swift
//  City Guide
//
//  Created by Omega on 20.07.2022.
//

import Foundation

final class RegistrationPresenter {
    unowned var view: RegistrationViewInput!
    var router: RegistrationRouterInput!
}

// MARK: - RegistrationPresenterInput

extension RegistrationPresenter: RegistrationPresenterInput {
    
}

// MARK: - RegistrationOutput

extension RegistrationPresenter: RegistrationRouterOutput {
    
}
