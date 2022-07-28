//
//  CitiesResponse.swift
//  City Guide
//
//  Created by Omega on 26.07.2022.
//

import Foundation

public struct CitiesFormResponse: Decodable {
    public let type: String
    public let features: [Features]
}

public struct Features: Decodable {
    public let id: String
    public let properties: CityProperty
    public let type: String
    public let geometry: Geometry
}

public struct CityProperty: Decodable {
    public let xid: String
    public let name: String
    public let kinds: String
    public let osm: String?
    public let wikidata: String?
    public let dist: Double?
    public let rate: Int
}

public struct Geometry: Decodable {
    public let type: String
    public let coordinates: [Coordinates]
}

public struct Coordinates: Decodable {
    public let lon: Double
    public let lat: Double
}
