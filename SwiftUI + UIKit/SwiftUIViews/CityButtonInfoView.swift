//
//  CityButtonInfoView.swift
//  City Guide
//
//  Created by Omega on 27.06.2022.
//

import SwiftUI

struct CityInfoButtonView: View {
    
    let city: City
    
    var body: some View {
        NavigationLink("Подробнее") {
            CityDescriptionView(currentCity: city)
        }
        .padding(.horizontal, 60)
        .padding(.vertical, 15)
        .font(.callout)
        .background(.purple)
        .foregroundColor(.white)
        .cornerRadius(16)
    }
}
