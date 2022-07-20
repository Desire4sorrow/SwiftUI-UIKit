//
//  UserDefaultKeys.swift
//  City Guide
//
//  Created by Omega on 01.07.2022.
//

import Foundation

@propertyWrapper public struct UserDefaultsBacked<Value: Codable> {

    let key: String
    let defaultValue: Value
    let storage = UserDefaults.standard

    public var wrappedValue: Value {
        get {
            guard let data = storage.data(forKey: key) else { return defaultValue }

            if let value = try? JSONDecoder().decode(Value.self, from: data) {
                return value
            }

            return defaultValue
        }
        set {
            if let optional = newValue as? AnyOptional, optional.isNil {
                storage.removeObject(forKey: key)
            } else if let data = try? JSONEncoder().encode(newValue) {
                storage.set(data, forKey: key)
            } else {
                assertionFailure("UserDefaults save error with key \(key)")
            }
            storage.synchronize()
        }
    }

    public init(key: String, defaultValue: Value) {
        self.key = key
        self.defaultValue = defaultValue
    }
}

public extension UserDefaultsBacked where Value: ExpressibleByNilLiteral {

    init(key: String) {
        self.init(key: key, defaultValue: nil)
    }
}

protocol AnyOptional {
    var isNil: Bool { get }
}

extension Optional: AnyOptional {
    var isNil: Bool { self == nil }
}
