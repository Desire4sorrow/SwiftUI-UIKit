//
//  CityImageView.swift
//  City Guide
//
//  Created by Omega on 28.06.2022.
//

import SwiftUI

struct CityImageView: View {
    @State private var blurValue = 0.0
    @State private var animationAmount = 0.0
    let city: City
    
    var body: some View {
        Image(city.cityImage)
            .resizable()
            .animation(.easeInOut(duration: 2), value: 2)
            .blur(radius: blurValue)
            .scaleEffect(animationAmount)
            .opacity(2 - animationAmount)
            .animation(.easeInOut, value: animationAmount)
            .onLoad {
                addNotificationObserver(name: .cityChanged) { _ in
                    self.updateImage()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    animationAmount = 1
                    blurValue = 0
                }
            }
    }
    
    func updateImage() {
        animationAmount = 0.5
        blurValue = 25
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            animationAmount = 1
            blurValue = 0
        }
    }
}
