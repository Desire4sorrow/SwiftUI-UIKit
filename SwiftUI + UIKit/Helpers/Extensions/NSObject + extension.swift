//
//  NSObject + extension.swift
//  City Guide
//
//  Created by Omega on 27.06.2022.
//

import Foundation

extension NSObject {
    
    static var className: String {
        String(describing: Self.self)
    }
}
