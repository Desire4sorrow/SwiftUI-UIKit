//
//  PlacesRequirements.swift
//  City Guide
//
//  Created by Omega on 26.07.2022.
//

import Foundation

public struct PlacesRequirements: Encodable {

    public let minLongitude: Double
    public let maxLongitude: Double
    public let minLatitude: Double
    public let maxLatitude: Double

    public init(
        minLongitude: Double,
        maxLongitude: Double,
        minLatitude: Double,
        maxLatitude: Double
    ) {
        self.minLongitude = minLongitude
        self.maxLongitude = maxLongitude
        self.minLatitude = minLatitude
        self.maxLatitude = maxLatitude
    }

    public enum CodingKeys: String, CodingKey {
        case minLongitude = "lon_min"
        case maxLongitude = "lon_max"
        case minLatitude = "lat_min"
        case maxLatitude = "lat_max"
    }
}
