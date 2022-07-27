//
//  NetworkError.swift
//  City Guide
//
//  Created by Omega on 27.07.2022.
//

import Foundation
import Moya

enum NetworkError: String, BaseError {

    case noInternetConnection
    case cannotConnect
    case timeout
    case unknown

    init(moyaError: MoyaError) {
        switch moyaError.nsCode {
        case NSURLErrorNotConnectedToInternet,
             NSURLErrorNetworkConnectionLost,
             NSURLErrorNotConnectedToInternet:
            self = .noInternetConnection
        case NSURLErrorCannotConnectToHost,
             NSURLErrorCannotFindHost:
            self = .cannotConnect
        case NSURLErrorTimedOut:
            self = .timeout
        default:
            self = .unknown
        }
    }
}
