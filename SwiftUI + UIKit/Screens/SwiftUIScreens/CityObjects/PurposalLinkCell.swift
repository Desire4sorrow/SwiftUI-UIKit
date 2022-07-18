//
//  PurposalLinkCell.swift
//  City Guide
//
//  Created by Omega on 18.07.2022.
//

import SwiftUI

struct PurposalLinkCell: View {

    let object: Object
    let viewModel: ObjectsViewModel

    var body: some View {
        GeometryReader { proxy in
            let topEdge = proxy.safeAreaInsets.top
            ObjectDescriptionView(objectModel: .init(
                object: object,
                cityName: viewModel.city,
                cityImage: viewModel.backgroundImage,
                topEdge: topEdge
            ))
            .ignoresSafeArea(.all, edges: .top)
        }
    }
}

