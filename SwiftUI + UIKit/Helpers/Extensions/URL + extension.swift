//
//  URL + extension.swift
//  City Guide
//
//  Created by Omega on 28.07.2022.
//

import Foundation

extension URL: ExpressibleByStringLiteral {

    public init(stringLiteral value: String) {
        self = URL(string: value)!
    }
}
