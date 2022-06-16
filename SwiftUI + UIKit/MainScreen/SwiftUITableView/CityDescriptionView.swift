//
//  CityDescriptionView.swift
//  SwiftUI + UIKit
//
//  Created by Omega on 16.06.2022.
//

import SwiftUI

struct CityDescriptionView: View {
    
    let currentCity: City
    
    var body: some View {
        
        VStack {
            Image(currentCity.cityImage)
                .resizable()
                .frame(height: 300)
                .padding()
            Text(currentCity.cityDescription)
                .padding()
        }
        .navigationTitle(currentCity.cityName)
    }
}
