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
    
    var btnBack : some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Text("Назад")
            }
        }
    }
    
    var body: some View {
        VStack {
            Image(currentCity.cityImage)
                .resizable()
                .frame(height: 300)
                .padding()
            Text(currentCity.cityDescription)
                .padding()
        }
        .background(Image("background-image"))
        
        .navigationTitle(currentCity.cityName)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
    }
}
