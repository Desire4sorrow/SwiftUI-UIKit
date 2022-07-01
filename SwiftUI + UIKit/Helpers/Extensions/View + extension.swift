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
}
