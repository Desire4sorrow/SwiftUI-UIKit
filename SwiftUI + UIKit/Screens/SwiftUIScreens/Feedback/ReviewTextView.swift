//
//  ReviewTextView.swift
//  City Guide
//
//  Created by Omega on 01.07.2022.
//

import SwiftUI

struct ReviewTextView: View {

    let model: ReviewModel

    var starsView: some View {
        HStack {

        }
    }

    var body: some View {
        VStack {

            Text(model.reviewText)
        }
    }
}
