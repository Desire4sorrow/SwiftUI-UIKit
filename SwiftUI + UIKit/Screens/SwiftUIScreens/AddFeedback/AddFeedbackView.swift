//
//  AddFeedbackView.swift
//  City Guide
//
//  Created by Omega on 30.06.2022.
//

import SwiftUI

struct AddFeedbackView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var text: String = ""
    
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
            TextField("Username", text: $text)
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}
