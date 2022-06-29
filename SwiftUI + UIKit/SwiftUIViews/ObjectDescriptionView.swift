//
//  ObjectDescriptionView.swift
//  City Guide
//
//  Created by Omega on 27.06.2022.
//

import SwiftUI

struct ObjectDescriptionView: View {
    
    let objectModel: ObjectDescriptionModel
    let maxHeight = UIScreen.main.bounds.height / 2.3
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                GeometryReader { proxy in
                    VStack(alignment: .leading, spacing: 15) {
                        Image(objectModel.object.objectIcon)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                }
                .frame(height: maxHeight)
            }
        }
    }
}
