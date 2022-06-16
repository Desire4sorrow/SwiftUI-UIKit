//
//  CityDescriptionView.swift
//  SwiftUI + UIKit
//
//  Created by Omega on 16.06.2022.
//

import SwiftUI

struct CityDescriptionView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var needShowAlert = false
    
    let currentCity: City
    
    var cityURL: String {
        currentCity.cityURL
    }
    
    var btnBack: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Text("Назад")
        }
    }
    
    var btnShare: some View {
        Button(action: actionSheet) {
            Image(systemName: "square.and.arrow.up")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
        }
    }
    
    var body: some View {
        VStack {
            Image(currentCity.cityImage)
                .resizable()
                .frame(height: 300)
                .cornerRadius(8)
            Text(currentCity.cityDescription)
                .padding()
                .background(Color.pink.opacity(0.6))
                .cornerRadius(8)
            Link("Показать на карте", destination: URL(string: cityURL)!)
                .padding()
                .background(Color.pink)
                .foregroundColor(Color.white)
                .cornerRadius(8)
        }
        .padding()
        .background(Image("background-image"))
        .navigationTitle(currentCity.cityName)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack, trailing: btnShare)
    }
    
    func actionSheet() {
        guard let urlShare = URL(string: "https://developer.apple.com/xcode/swiftui/") else { return }
        let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
}
