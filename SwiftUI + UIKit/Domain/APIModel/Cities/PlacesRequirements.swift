//
//  PlacesRequirements.swift
//  City Guide
//
//  Created by Omega on 26.07.2022.
//

import Foundation

public struct PlacesRequirements: Encodable {
    public let country: String? = "RU"
    public let access_token: String? = AppConfig.apiKey
    public let level: Int? = 2

    public var parameters: [String: Any] {
        [
            "country": country!,
            "api_key": access_token!,
            "level": level!
        ]
    }
}
