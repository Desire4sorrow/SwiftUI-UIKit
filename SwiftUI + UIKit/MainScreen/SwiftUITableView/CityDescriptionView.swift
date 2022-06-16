//
//  CityDescriptionView.swift
//  SwiftUI + UIKit
//
//  Created by Omega on 16.06.2022.
//

import SwiftUI

struct CityDescriptionView: View {
    @Environment(\.presentationMode) var presentationMode
    let currentCity: City
    
    var cityURL: String {
        currentCity.cityURL
    }
    
    var btnBack : some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Text("Назад")
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
        .navigationBarItems(leading: btnBack)
    }
}
