//  
//  RegistrationConfigurator.swift
//  City Guide
//
//  Created by Omega on 20.07.2022.
//

import UIKit

struct RegistrationConfigurator {

    static func configure() -> RegistrationViewController {
        let storyboard = UIStoryboard(name: "Registration", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
        let presenter = RegistrationPresenter()
        let router = RegistrationRouter()
        
        view.presenter = presenter
        
        router.presenter = presenter
        router.view = view
        
        presenter.view = view
        presenter.router = router

        return view
    }
}
