//
//  String + validation.swift
//  City Guide
//
//  Created by Omega on 21.07.2022.
//

import Foundation

extension String {

    func isValidEmail() -> Bool {
        let emailPattern = "^[a-z\\d][a-z\\d._%+-]*@[a-z\\d.-]+\\.[a-z]{2,6}"
        return match(pattern: emailPattern, caseSensitive: false)
    }

    func match(pattern: String, caseSensitive: Bool = true) -> Bool {
        let format = caseSensitive ? "SELF MATCHES %@" : "SELF MATCHES[c] %@"
        return NSPredicate(format: format, pattern).evaluate(with: self)
    }

    func isValidPhoneNumber() -> Bool {
        onlyDigitsText().count == 11
    }

    func onlyDigitsText() -> String {
        components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: "")
    }

    var withCapitalizedFirstLetter: String {
        prefix(1).uppercased() + dropFirst()
    }
}
