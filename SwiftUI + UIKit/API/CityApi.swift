//
//  CityApi.swift
//  City Guide
//
//  Created by Omega on 27.07.2022.
//

import Foundation
import Moya

public enum CityApi: TargetType {

    case getCities(info: PlacesRequirements)

    public var path: String {
        switch self {
        case .getCities:
            return "places/bbox"
        }
    }

    public var baseURL: URL {
        AppConfig.baseUrl
    }

    public var headers: [String : String]? {
        nil
    }

    public var method: Moya.Method { .get }

    public var task: Task {
        switch self {
        case .getCities(let info):
            return .requestParameters(parameters: info.parameters, encoding: URLEncoding.default)
        }
    }
}
