//
//  SplashScreenConfigurator.swift
//  City Guide
//
//  Created by Omega on 11.08.2022.
//

import UIKit

struct SplashScreenConfigurator {

    static func configure() -> SplashScreenViewController {
        let storyboard = UIStoryboard(name: "SplashScreen", bundle: nil)
        let view = storyboard
            .instantiateViewController(withIdentifier: "SplashScreenViewController") as! SplashScreenViewController
        let presenter = SplashScreenPresenter()
        let router = SplashScreenRouter()

        view.presenter = presenter

        router.presenter = presenter
        router.view = view

        presenter.view = view
        presenter.router = router

        return view
    }
}
