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
        Text("Text отзыва")
        Text("Text отзыва")
        Text("Text отзыва")
        Text("Text отзыва")
        Text("Text отзыва")
        Text("Text отзыва")
        Text("Text отзыва")
        Text("Text отзыва")
        Text("Text отзыва")
        Text("Text отзыва")
      }

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
