//
//  ReviewRow.swift
//  City Guide
//
//  Created by Omega on 01.07.2022.
//

import SwiftUI

struct ReviewRow: View {

    let model: ReviewModel

    var body: some View {
        HStack {
            Circle()
                .frame(width: 30, height: 30)
            Text(model.name)
                .padding(.trailing)
            Spacer()
            Text("Оценка: \(model.mark)")
        }
    }
}
