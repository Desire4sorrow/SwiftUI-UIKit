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

    public static var apiKey: String {
        "5ae2e3f221c38a28845f05b61f9b9c513c70321767d7e6983b550432"
    }
}
