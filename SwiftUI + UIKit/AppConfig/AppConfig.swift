//
//  AppConfig.swift
//  City Guide
//
//  Created by Omega on 26.07.2022.
//

import Foundation

public enum AppConfig {

    static let localEnvironment: EnvironmentURL = .dev

    public static var baseUrl: URL {
        EnvironmentURL.current.baseUrl.appendingPathComponent(localEnvironment.langModifier)
    }
}
