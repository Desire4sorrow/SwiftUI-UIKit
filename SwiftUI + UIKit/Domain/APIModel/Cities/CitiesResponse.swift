//
//  CitiesResponse.swift
//  City Guide
//
//  Created by Omega on 26.07.2022.
//

import Foundation

public struct CitiesResponse: Decodable {
    public let status: Int
    public let items: [Items]
}

public struct Items: Decodable {
    public let id: Int
    public let name: String
    public let latitude: Double
    public let longitude: Double
}
