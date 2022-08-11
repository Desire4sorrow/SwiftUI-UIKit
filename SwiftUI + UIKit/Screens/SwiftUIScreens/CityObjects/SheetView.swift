//
//  SheetView.swift
//  City Guide
//
//  Created by Omega on 26.07.2022.
//

import SwiftUI

struct SheetView: View {

    @Environment(\.presentationMode) var presentationMode

    var object: Object

    var hideButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Text("Понятно")
        }
        .padding(.horizontal, 60)
        .padding(.vertical, 15)
        .font(.callout)
        .background(Color.guidePurple)
        .foregroundColor(.white)
        .cornerRadius(16)
        .shadow(radius: 3)
    }

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 35) {
                Text("Как добраться?")
                    .font(.title3.bold())
                    .foregroundColor(.guidePurple)
                ForEach(object.reachInfo) { info in
                    TransportRow(
                        imagePath: info.imagePath,
                        transportType: info.transportType,
                        transportVariables: info.transportVariables
                    )
                }
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 15)
            Spacer()
            hideButton
        }
        .padding(.bottom, 10)
        .background(
            Image("transport-background")
                .opacity(0.7)
        )
    }
}
