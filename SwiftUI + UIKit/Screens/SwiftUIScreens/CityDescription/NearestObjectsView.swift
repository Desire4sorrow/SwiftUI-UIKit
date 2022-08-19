//
//  NearestObjectsView.swift
//  City Guide
//
//  Created by Omega on 19.08.2022.
//

import SwiftUI

struct NearestObjectsView: View {
    let city: City

    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(city.nearestObjects, id: \.self) { object in
                        GeometryReader { proxy in
                            ObjectCardView(nearestObject: object)
                                .rotation3DEffect(
                                    .degrees(-Double(proxy.frame(in: .global).minX) / 15),
                                    axis: (x: 0, y: 1, z: 0)
                                )
                        }
                        .frame(width: 370, height: 400)
                    }
                }
            }
        }
    }
}
