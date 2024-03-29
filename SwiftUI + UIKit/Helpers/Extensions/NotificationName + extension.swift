//
//  NotificationName + extension.swift
//  City Guide
//
//  Created by Omega on 27.06.2022.
//

import Foundation

public extension Notification.Name {
    static let cityChanged = Self(rawValue: "cityChanged")
    static let logout = Self(rawValue: "logout")
    static let dataConfigured = Self(rawValue: "dataConfigured")
}
