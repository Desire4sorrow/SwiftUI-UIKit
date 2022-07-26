//
//  TransportRow.swift
//  City Guide
//
//  Created by Omega on 26.07.2022.
//

import SwiftUI

struct TransportRow: View {

    let imagePath: String
    let transportType: String
    let transportVariables: String

    var body: some View {
        HStack {
            Image(imagePath)
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.trailing, 15)
            Text(transportType)
            Spacer()
            Text(transportVariables)
                .foregroundColor(.guidePurple)
                .scaledFont(name: "Trebuchet MS", size: 14)
        }
    }
}
