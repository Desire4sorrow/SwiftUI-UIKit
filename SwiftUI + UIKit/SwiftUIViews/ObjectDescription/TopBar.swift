//
//  TopBar.swift
//  City Guide
//
//  Created by Omega on 29.06.2022.
//

import SwiftUI

struct TopBar: View {
    
    @Binding var offset: CGFloat
    
    let edge: CGFloat
    let object: Object
    
    var body: some View {
            ZStack(alignment: .bottomLeading) {
                Image(object.objectIcon)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                Text(object.objectName)
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 4, x: 1, y: 1)
                    .padding()
            }
            .padding(.bottom)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        }
}
