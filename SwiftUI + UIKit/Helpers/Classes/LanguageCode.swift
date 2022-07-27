//
//  LanguageCode.swift
//  City Guide
//
//  Created by Omega on 27.07.2022.
//

import Foundation

public enum LanguageCode: String, CaseIterable, Codable {
    case ru
    case en

    public static var current: LanguageCode {
        get {
            .init(rawValue: currentCode)!
        }
        set {
            currentCode = newValue.rawValue
        }
    }

    @UserDefaultsBacked(key: "languageCode", defaultValue: LanguageCode(locale: .current).rawValue)
    public static var currentCode: String

    public var identifier: String {
        switch self {
        case .ru:
            return "ru_RU"
        case .en:
            return "en"
        }
    }

    public var localized: String {
        switch self {
        case .ru:
            return "label_russian".localized()
        case .en:
            return "label_english".localized()
        }
    }

    public var index: Int {
        Self.allCases.firstIndex(of: self)!
    }
}

public extension LanguageCode {

    init(locale: Locale) {
        self = LanguageCode.allCases.first { $0.identifier == locale.identifier } ?? .en
    }
}
