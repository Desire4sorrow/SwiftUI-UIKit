//
//  CityViewModel.swift
//  SwiftUI + UIKit
//
//  Created by Omega on 15.06.2022.
//

import SwiftUI

class CityViewModel: ObservableObject {
    @Published private(set) var currentCity: City

    init(currectCity: City) {
        currentCity = currectCity
    }

    func update(newCity: City) {
        withAnimation {
            currentCity = newCity
        }
    }
}
