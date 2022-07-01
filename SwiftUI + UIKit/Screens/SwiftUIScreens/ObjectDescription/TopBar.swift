//
//  TopBar.swift
//  City Guide
//
//  Created by Omega on 29.06.2022.
//

import SwiftUI

struct TopBar: View {
    
    @Binding var offset: CGFloat
    
    let topBarModel: TopBarModel
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(topBarModel.object.objectIcon)
                .resizable()
                .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.orange, lineWidth: 0))
                .aspectRatio(contentMode: .fill)
            Text(topBarModel.object.objectName)
                .font(.largeTitle.bold())
                .foregroundColor(.white)
                .shadow(color: .black, radius: 4, x: 1, y: 1)
                .padding()
        }
        .padding(.bottom)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    }
}
