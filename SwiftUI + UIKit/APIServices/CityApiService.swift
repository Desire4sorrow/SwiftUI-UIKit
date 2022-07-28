//
//  CityApiService.swift
//  City Guide
//
//  Created by Omega on 27.07.2022.
//

import Foundation
import Moya
import Promises

public struct CityApiService: CitiesApiService {

    let provider = MoyaProvider<CityApi>()

    public init() {}

    public func getCities(info: PlacesRequirements) -> Promise<CitiesResponse> {
        provider.request(.getCities(info: info))
    }
}
