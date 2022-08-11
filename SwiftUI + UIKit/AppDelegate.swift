//
//  AppDelegate.swift
//  SwiftUI + UIKit
//
//  Created by Omega on 15.06.2022.
//

import FirebaseCore
import UIKit

@main class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    private var splashPresenter: SplashPresenter? = SplashPresenter()

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        splashPresenter?.present()
        let delay: TimeInterval = 2
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.splashPresenter?.dismiss { [weak self] in
                self?.splashPresenter = nil
            }
        }

        MainAssembler.start()

        let window = UIWindow(frame: UIScreen.main.bounds)
        let nc = UINavigationController(rootViewController: MainScreenConfigurator.configure())
        window.rootViewController = nc
        window.makeKeyAndVisible()
        self.window = window

        FirebaseApp.configure()

        return true
    }
}
