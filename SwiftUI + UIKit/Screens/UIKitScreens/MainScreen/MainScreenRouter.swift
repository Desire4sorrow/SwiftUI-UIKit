//
//  MainScreenRouter.swift
//  SwiftUI + UIKit
//
//  Created by Omega on 15.06.2022.
//

import UIKit

final class MainScreenRouter {
    unowned var view: UIViewController!
    unowned var presenter: MainScreenRouterOutput!
}

extension MainScreenRouter: MainScreenRouterInput {}
