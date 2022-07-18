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

    var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image.backArrow
                .foregroundColor(.pink)
        }
    }

    var body: some View {
        VStack {
            List {
                ForEach(FeedbackView.reviewList) { model in
                    if !FeedbackView.reviewList.isEmpty {
                        NavigationLink(destination: ReviewTextView(model: model)) {
                            ReviewRow(model: model)
                        }
                    } else {
                        Text("Отзывов пока нет")
                    }
                }
            }
            .listRowSeparator(.hidden)

            NavigationLink("Оставить отзыв") {
                AddFeedbackView()
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
