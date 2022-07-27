//
//  BaseError.swift
//  City Guide
//
//  Created by Omega on 27.07.2022.
//

import Foundation
import LetterCase

public protocol BaseError: LocalizedError, RawRepresentable where Self.RawValue == String {}

public extension BaseError {

    var errorDescription: String? {
        let prefix = String(describing: Self.self)
        let title = rawValue.withCapitalizedFirstLetter
        let localizationKey = (prefix + title).convert(from: .upperCamel, to: .kebab)
        return localizationKey.localized()
    }
}

