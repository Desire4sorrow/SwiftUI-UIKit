//
//  MainScreenConfigurator.swift
//  SwiftUI + UIKit
//
//  Created by Omega on 15.06.2022.
//

import UIKit

struct MainScreenConfigurator {
    static func configure() -> MainScreenViewController {
        let storyboard = UIStoryboard(name: "MainScreen", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "MainScreenViewController") as! MainScreenViewController
        let presenter = MainScreenPresenter()
        let router = MainScreenRouter()

        view.presenter = presenter

        router.presenter = presenter
        router.view = view

        presenter.view = view
        presenter.router = router

        return view
    }
}
