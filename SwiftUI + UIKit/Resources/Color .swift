//
//  Color.swift
//  City Guide
//
//  Created by Omega on 28.06.2022.
//

import SwiftUI

extension Color {
    static let guidePink = Color("GuidePink")
    static let guidePurple = Color("GuidePurple")
    static let guidePinkWithHighOpacity = Color.guidePink.opacity(0.3)
    static let guidePinkWithLowOpacity = Color.guidePink.opacity(0.7)
    static let guidePurpleWithLowOpacity = Color.guidePurple.opacity(0.7)
    static let guidePurpleWithHighOpacity = Color.guidePurple.opacity(0.3)
}
