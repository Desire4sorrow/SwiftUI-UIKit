//
//  ServerError.swift
//  City Guide
//
//  Created by Omega on 27.07.2022.
//

import Foundation

struct ServerError: CustomNSError {

    static var errorDomain = "SERVER_REQUEST_ERROR"
    let statusCode: Int
    private let error: String
    private let message: ErrorMessage

    var errorUserInfo: [String : Any] {
        [NSLocalizedDescriptionKey: message.message]
    }

    var errorCode: Int {
        message.code
    }
}

extension ServerError: Decodable {

    enum CodingKeys: String, CodingKey {
        case error
        case statusCode
        case message
    }
}

public struct ErrorMessage: Decodable {
    public let message: String
    public let code: Int
}
