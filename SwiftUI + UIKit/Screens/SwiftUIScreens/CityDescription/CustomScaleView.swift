//
//  CustomScaleView.swift
//  City Guide
//
//  Created by Omega on 31.08.2022.
//

import SwiftUI

struct CustomScaleView: View {
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            let width = (size.width / 10)
            let itemCount = Int((size.height / width).rounded())
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0),
                                     count: 10),spacing: 0) {
                ForEach(0..<itemCount, id: \.self) { _ in
                    
                    
                }
            }
        }
        .padding(15)
    }
}
