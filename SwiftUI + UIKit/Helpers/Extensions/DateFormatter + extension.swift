//
//  DateFormatter + extension.swift
//  City Guide
//
//  Created by Omega on 27.07.2022.
//

import Foundation

public extension DateFormatter {

    convenience init(format: String) {
        self.init()
        dateFormat = format
        calendar = .init(identifier: .gregorian)
    }

    static let `default`: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        formatter.timeZone = .init(abbreviation: "UTC")
        return formatter
    }()
}
