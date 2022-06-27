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
            withAnimation(.easeInOut(duration: 1)) {
                city = newValue
            }
        }
        .background(
            Image("background-image")
                .blur(radius: 25)
        )
    }
}

struct CityImageView: View {
    @State private var blurValue = 0.0
    @State private var animationAmount = 0.0
    let city: City
    
    var body: some View {
        Image(city.cityImage)
            .resizable()
            .animation(.easeInOut(duration: 2), value: 2)
            .onAppear {
                withAnimation {
                    
                }
            }
    }
}
//            .blur(radius: blurValue)
//            .scaleEffect(animationAmount)
//            .opacity(2 - animationAmount)
//            .animation(.easeInOut, value: animationAmount)
//            .onLoad {
//                addNotificationObserver(name: .cityChanged) { _ in
//                    self.updateImage()
//                }
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                    animationAmount = 1
//                    blurValue = 0
//                }
//            }
//    }
//
//    func updateImage() {
//        animationAmount = -0.1
//        blurValue = 25
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//            animationAmount = 1
//            blurValue = 0
//        }
//    }

