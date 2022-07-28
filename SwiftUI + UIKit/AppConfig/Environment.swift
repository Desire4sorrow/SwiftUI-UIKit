//
//  EnvironmentURL.swift
//  City Guide
//
//  Created by roman LaPtop on 26.07.2022.
//

import Foundation

public enum EnvironmentURL: String {

    case dev

    public var baseUrl: URL {
        URL(string: "https://htmlweb.ru/json/geo")!
    }

    public static var current: Self {
        AppConfig.localEnvironment
    }
}
