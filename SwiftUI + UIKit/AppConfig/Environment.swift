//
//  EnvironmentURL.swift
//  City Guide
//
//  Created by Omega on 26.07.2022.
//

import Foundation

public enum EnvironmentURL: String {

    case dev

    public var baseUrl: URL {
        URL(string: "https://api.opentripmap.com/0.1")!
    }

    var langModifier: String { "ru" }

    public static var current: Self {
        AppConfig.localEnvironment
    }
}
