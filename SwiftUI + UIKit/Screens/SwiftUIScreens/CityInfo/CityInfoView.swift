//
//  CityInfoView.swift
//  SwiftUI + UIKit
//
//  Created by Omega on 15.06.2022.
//

import Foundation
import SwiftUI

struct CityInfoView: View {
  @ObservedObject var viewModel: CityViewModel

  @State private var city: City = .kazan

  var body: some View {
    VStack {
      CityImageView(city: city)
      CityInfoButtonView(city: viewModel.currentCity)
      Spacer()
    }
    .onReceive(viewModel.$currentCity) { newValue in
      withAnimation(.easeInOut(duration: 0.1)) {
        city = newValue
      }
    }
    .background(
      Image.background
        .blur(radius: 25)
    )
    .shadow(radius: 3)
  }
}
