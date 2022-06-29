//
//  OffsetModifier.swift
//  City Guide
//
//  Created by Omega on 29.06.2022.
//

import SwiftUI

struct OffsetModifier: ViewModifier {
    
    @Binding var offset: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { proxy -> Color in
                    
                    let minY = proxy.frame(in: .named("availableScroll")).minY
                    
                    DispatchQueue.main.async {
                        self.offset = minY
                    }
                
                    return Color.clear
                }
                ,alignment: .top
            )
    }
}

