//
//  ObjectCardView.swift
//  City Guide
//
//  Created by Omega on 19.08.2022.
//

import SwiftUI

struct ObjectCardView: View {

    let nearestObject: NearestObjectsModel

    var body: some View {
        VStack {
            Image(nearestObject.imagePath)
                .resizable()
                .cornerRadius(15)
            Text(nearestObject.objectName)
                .font(.title2.bold())
        }
        .frame(width: 325, height: 275)
        .cornerRadius(15)
        .shadow(color: .accentColor.opacity(0.2), radius: 5, x: 4, y: 4)
        .padding(.horizontal, 20)
    }
}
