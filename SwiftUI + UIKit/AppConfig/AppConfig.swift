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
        EnvironmentURL.current.baseUrl
    }

    public static var apiKey: String {
        "1cb0705bec08070580b46bce9304ac5b"
    }
}
