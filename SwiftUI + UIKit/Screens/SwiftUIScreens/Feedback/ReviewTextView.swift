//
//  ReviewTextView.swift
//  City Guide
//
//  Created by Omega on 01.07.2022.
//

import Introspect
import SwiftUI

struct ReviewTextView: View {

    @Environment(\.presentationMode) var presentationMode
    let model: ReviewModel
    let maxMark = 5

    @State private var actingStars = 5
    @State private var hiddenStars = 0

    var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image.backArrow
                .foregroundColor(.pink)
        }
    }

    var starsView: some View {
        HStack {
            ForEach(0 ..< actingStars, id: \.self) { _ in
                Image("review-star")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .padding(8)
            ForEach(0 ..< hiddenStars, id: \.self) { _ in
                Image("star-hidden")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .padding(8)
        }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                starsView
                Text("Автор: ")
                    .font(.title3.bold())
                Text(model.name)
                Text("Содержание: ")
                    .font(.title3.bold())
                Text(model.reviewText)
                Spacer()
            }
            .padding()
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton)
            .introspectViewController { nav in
                nav.navigationItem.title = "Отзыв"
            }
            .onAppear {
                hiddenStars = maxMark - model.mark
                actingStars = maxMark - hiddenStars
            }
        }
        .background(Color.guidePinkWithHighOpacity)
    }
}
