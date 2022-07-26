//
//  CitiesResponse.swift
//  City Guide
//
//  Created by Omega on 26.07.2022.
//

import Foundation

public struct CitiesResponse: Decodable {
    public let xid: String
    public let name: String
    public let kinds: String
    public let osm: String?
    public let wikidata: String?
    public let dist: Double?
    public let point: Points
}

public struct Points: Decodable {
    public let lon: Double
    public let lat: Double
}
