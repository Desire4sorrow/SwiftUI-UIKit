//
//  ObjectDescriptionView.swift
//  City Guide
//
//  Created by Omega on 27.06.2022.
//

import SwiftUI

struct ObjectDescriptionView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var offset: CGFloat = 0
    
    let objectModel: ObjectDescriptionModel
    let maxHeight = UIScreen.main.bounds.height / 2.3
    
    var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "arrow.left")
                .foregroundColor(.pink)
        }
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                GeometryReader { proxy in
                    TopBar(offset: $offset, edge: objectModel.topEdge, object: objectModel.object)
                        .frame(height: maxHeight + offset, alignment: .bottom)
                }
                .frame(height: maxHeight)
                .offset(y: -offset)
            }
            .modifier(OffsetModifier(offset: $offset))
        }
        .coordinateSpace(name: "availableScroll")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}
