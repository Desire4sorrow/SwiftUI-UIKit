//
//  ReviewTextView.swift
//  City Guide
//
//  Created by Omega on 01.07.2022.
//

import SwiftUI

struct ReviewTextView: View {

    let model: ReviewModel

    var body: some View {
        Text(model.reviewText)
    }
}
