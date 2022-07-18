//
//  FeedbackView.swift
//  City Guide
//
//  Created by Omega on 30.06.2022.
//

import Introspect
import SwiftUI

struct FeedbackView: View {

    @Environment(\.presentationMode) var presentationMode

    @UserDefaultsBacked(key: "reviewList", defaultValue: [])
    static var reviewList: [ReviewModel]

    let objectId: Int

    var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image.backArrow
                .foregroundColor(.pink)
        }
    }

    var reviewList: some View {
        List {
            let reviewsById = FeedbackView.reviewList.filter { element in
                element.objectId == objectId
            }
            if reviewsById.isEmpty {
                Text("Отзывов пока не оставлено")
            }
            ForEach(reviewsById) { model in
                NavigationLink(destination: ReviewTextView(model: model)) {
                    ReviewRow(model: model)
                }
            }
        }
    }

    var body: some View {
        VStack(spacing: 15) {
            reviewList
                .listRowSeparator(.hidden)
            Text("Средняя оценка: 5")
            NavigationLink("Оставить отзыв") {
                AddFeedbackView(objectId: objectId)
            }
            .padding(.horizontal, 60)
            .padding(.vertical, 15)
            .font(.callout)
            .background(Color.guidePurple)
            .foregroundColor(.white)
            .cornerRadius(16)
            .shadow(radius: 3)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        .introspectViewController { nav in
            nav.navigationItem.title = "Отзывы"
        }
        .padding(.bottom, 20)
        .background(Color.guidePurpleWithHighOpacity)
    }
}
