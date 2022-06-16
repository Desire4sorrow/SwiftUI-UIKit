//
//  CityInfoView.swift
//  SwiftUI + UIKit
//
//  Created by Omega on 15.06.2022.
//

import SwiftUI

struct CityInfoView: View {
    @ObservedObject var viewModel: CityViewModel
    @State var animationOpacity: Double = 0
    @State var animationDuration: Double = 0
    
    var body: some View {
        VStack {
            Image(viewModel.currentCity.cityImage)
                .resizable()
            NavigationLink("Подробнее") {
                CityDescriptionView(currentCity: viewModel.currentCity)
            }
            .padding()
            .font(Font.title3)
        }
        .background(Color.pink.opacity(0.2))
        .opacity(animationOpacity)
        .animation(.easeIn(duration: animationDuration))
        .onAppear {
            withAnimation {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    animationDuration = 1
                    animationOpacity = 1
                }
            }
        }
    }
}
