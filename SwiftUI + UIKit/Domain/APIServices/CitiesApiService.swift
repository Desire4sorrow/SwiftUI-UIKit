//
//  CitiesApiService.swift
//  City Guide
//
//  Created by Omega on 26.07.2022.
//

import Foundation
import Promises

public protocol CitiesApiService {
    func getCities(info: PlacesRequirements) -> Promise<CitiesFormResponse>
}
