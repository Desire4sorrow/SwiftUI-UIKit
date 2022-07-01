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

    @UserDefaultsBacked(key: "savedMark", defaultValue: nil)
    static var savedMark: Int?
    @UserDefaultsBacked(key: "savedReview", defaultValue: "")
    static var savedReview: String

    var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image.backArrow
                .foregroundColor(.pink)
        }
    }

    var reviewTextView: some View {
        TextEditor(text: $text)
            .frame(height: 200)
            .background(Color.guidePinkWithHighOpacity)
            .onChange(of: text) { _ in
            }
    }

    var addButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
            AddFeedbackView.savedMark = currentMarks
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
            Picker(" ", selection: $currentMarks) {
                ForEach(1..<6) { index in
                    Text("\(index)").tag(index)
                }
            }
        }
    }

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                markRow
                Text("Текст отзыва")
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
