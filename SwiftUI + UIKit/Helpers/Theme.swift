//
//  Theme.swift
//  City Guide
//
//  Created by Omega on 28.06.2022.
//

import Foundation
import UIKit

class Theme {
    static func navigationBarColors(
        background: UIColor?,
        titleColor: UIColor? = nil,
        tintColor: UIColor? = nil
    ) {
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.configureWithOpaqueBackground()
        navigationAppearance.backgroundColor = background ?? .clear

        navigationAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .black]
        navigationAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? .black]

        UINavigationBar.appearance().standardAppearance = navigationAppearance
        UINavigationBar.appearance().compactAppearance = navigationAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance

        UINavigationBar.appearance().tintColor = tintColor ?? titleColor ?? .black
    }
}
