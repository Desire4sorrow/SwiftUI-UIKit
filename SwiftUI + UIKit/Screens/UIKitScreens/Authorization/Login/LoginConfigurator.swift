//
//  LoginConfigurator.swift
//  City Guide
//
//  Created by Omega on 20.07.2022.
//

import UIKit

struct LoginConfigurator {

    static func configure() -> LoginViewController {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let presenter = LoginPresenter()
        let router = LoginRouter()

        view.presenter = presenter

        router.presenter = presenter
        router.view = view

        presenter.view = view
        presenter.router = router

        return view
    }
}
