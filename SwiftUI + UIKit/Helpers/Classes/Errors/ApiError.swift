//
//  ApiError.swift
//  City Guide
//
//  Created by Omega on 27.07.2022.
//

import Foundation

enum ApiError: String, BaseError {
    case emptyJson
    case invalidJson
    case timeout
    case unknown
}

