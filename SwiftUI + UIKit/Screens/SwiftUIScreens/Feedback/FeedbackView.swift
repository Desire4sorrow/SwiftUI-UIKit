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
    @State var reviewsById: [ReviewModel] = []
    @Binding var middleMark: Double

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
            let reviewsList = FeedbackView.reviewList.filter { element in
                element.objectId == objectId
            }
            if reviewsList.isEmpty {
                Text("Отзывов пока не оставлено")
            }
            ForEach(reviewsList) { model in
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
            Text("Средняя оценка: " + String(format: "%.2f", middleMark))
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
        .onAppear {
            middleMark = 0.0
            reviewsById = FeedbackView.reviewList.filter { element in
                element.objectId == objectId
            }
            reviewsById.forEach { element in
                middleMark += Double(element.mark)
            }
            middleMark = middleMark / Double(reviewsById.count)
        }
    }
}
