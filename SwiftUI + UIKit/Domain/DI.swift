//
//  DI.swift
//  City Guide
//
//  Created by Omega on 26.07.2022.
//

import Foundation

@propertyWrapper public struct DI<Value> {

    public let wrappedValue = resolve(type: Value.self)

    public init() {}
}
