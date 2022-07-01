//
//  AddFeedbackView.swift
//  City Guide
//
//  Created by Omega on 30.06.2022.
//

import Introspect
import SwiftUI

struct AddFeedbackView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var text = ""
    @State private var currentMarks = 5
    @State private var senderName = ""
    @UserDefaultsBacked(key: "id", defaultValue: 0)
    static var reviewId: Int

    var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image.backArrow
                .foregroundColor(.pink)
        }
    }

    var reviewTextView: some View {
        VStack(alignment: .leading) {
            Text("Текст отзыва:")
            VStack {
                TextEditor(text: $text)
                    .cornerRadius(10)
                    .frame(height: 200)
                    .background(Color.guidePinkWithHighOpacity)
            }
            .cornerRadius(10)
        }
    }

    var addButton: some View {
        Button {
            if text != "", senderName != "" {
                AddFeedbackView.reviewId += 1
                FeedbackView.reviewList.append(.init(
                    id: AddFeedbackView.reviewId,
                    name: senderName,
                    mark: currentMarks,
                    reviewText: text
                ))
                print(FeedbackView.reviewList)
            }
            presentationMode.wrappedValue.dismiss()

        } label: {
            Text("Добавить")
        }
        .padding(.horizontal, 60)
        .padding(.vertical, 15)
        .font(.callout)
        .background(Color.guidePurple)
        .foregroundColor(.white)
        .cornerRadius(16)
        .shadow(radius: 3)
    }

    var markRow: some View {
        HStack {
            Text("Выберите оценку:")
            Spacer()
            Picker("", selection: $currentMarks) {
                ForEach(1..<6) { index in
                    Text("\(index)").tag(index)
                }
            }
        }
    }

    var nameTextField: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Введите Ваше имя:")
            VStack {
                TextField(text: $senderName) {}
                    .frame(height: 40)
                    .cornerRadius(10)
                    .padding(.leading, 5)
                    .background(.white)
            }
            .cornerRadius(10)
        }
    }

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                markRow
                nameTextField
                reviewTextView
            }
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
            Spacer()
            addButton
        }
        .padding()
        .introspectViewController { nav in
            nav.navigationItem.title = "Добавить отзыв"
        }
        .background(Color.guidePinkWithHighOpacity)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}
