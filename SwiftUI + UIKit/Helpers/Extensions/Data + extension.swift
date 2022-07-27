//
//  Data + extension.swift
//  City Guide
//
//  Created by Omega on 27.07.2022.
//

import Foundation
import UIKit

public extension Data {

    var hexString: String {
        map { String(format: "%02.2hhx", $0) }.joined()
    }

    var prettyPrintedJSON: String {
        guard let object = jsonObject,
              let data = try? JSONSerialization.data(withJSONObject: object, options: .prettyPrinted),
              let string = String(data: data, encoding: .utf8) else
        {
            return ""
        }
        return string
    }

    var jsonObject: Any? {
        try? JSONSerialization.jsonObject(with: self, options: .allowFragments)
    }

    var json: [String: Any]? {
        jsonObject as? [String: Any]
    }

    init?(object: Any) {
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: .fragmentsAllowed) else {
            return nil
        }
        self = data
    }
}
