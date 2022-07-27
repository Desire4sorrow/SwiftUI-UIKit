//
//  JSONDecoder + default.swift
//  City Guide
//
//  Created by Omega on 27.07.2022.
//

import Foundation

public extension JSONDecoder {

    static var `default`: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.default)
        return decoder
    }
}
