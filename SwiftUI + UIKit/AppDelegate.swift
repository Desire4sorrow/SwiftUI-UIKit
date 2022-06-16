//
//  AppDelegate.swift
//  SwiftUI + UIKit
//
//  Created by Omega on 15.06.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let nc = UINavigationController(rootViewController: MainScreenConfigurator.configure())
        window.rootViewController = nc
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
}
