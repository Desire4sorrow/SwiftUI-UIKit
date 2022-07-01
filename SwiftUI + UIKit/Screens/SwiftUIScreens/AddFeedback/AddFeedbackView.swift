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
    @State private var marks = 5

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

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text("Выберите оценку:")
                    Spacer()
                    Picker("Текущая: ", selection: $marks) {
                        ForEach(1..<6) {
                            Text("\($0)")
                        }
                    }
                }
                .font(.title2)
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
