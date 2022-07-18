//
//  View + extension.swift
//  City Guide
//
//  Created by Omega on 27.06.2022.
//

import SwiftUI

extension View {

    func onLoad(perform action: (() -> Void)? = nil) -> some View {
        modifier(ViewDidLoadModifier(perform: action))
    }

    func scaledFont(name: String, size: Double) -> some View {
        modifier(ScaledFont(name: name, size: size))
    }

    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
