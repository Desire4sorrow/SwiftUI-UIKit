//
//  Logger.swift
//  City Guide
//
//  Created by Omega on 27.07.2022.
//

import Foundation

public enum Logger {

    public static func errorText(_ items: Any...) {
        print("❌", terminator: " ")
        items.enumerated().forEach({ print($1, terminator: $0 < items.count - 1 ? " " : "\n") })
    }

    public static func warning(_ items: Any...) {
        print("⚠️", terminator: " ")
        items.enumerated().forEach({ print($1, terminator: $0 < items.count - 1 ? " " : "\n") })
    }

    public static func info(_ items: Any...) {
        print("ℹ️", terminator: " ")
        items.enumerated().forEach({ print($1, terminator: $0 < items.count - 1 ? " " : "\n") })
    }

    public static func debug(_ items: Any..., separator _: String = " ", terminator _: String = "\n") {
        items.enumerated().forEach({ print($1, terminator: $0 < items.count - 1 ? " " : "\n") })
    }

    public static func error(_ e: Error, prefixString: String = "") {
        let errorString = prefixString.isEmpty ? e.localizedDescription : "\(prefixString): \(e.localizedDescription)"
        errorText(errorString)
    }
}
