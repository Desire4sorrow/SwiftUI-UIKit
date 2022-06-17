//
//  CityDescriptionView.swift
//  SwiftUI + UIKit
//
//  Created by Omega on 16.06.2022.
//

import SwiftUI

struct CityDescriptionView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var isSharePresented = false
    
    let currentCity: City
    
    let telegramActivity = CustomActivity(title: "Telegram", imageName: "telegram") {
        UIApplication.shared.open(URL(string: "https://omega-r.ru")!)
    }
    
    let whatsAppActivity = CustomActivity(title: "Whats App", imageName: "whats-app") {
        UIApplication.shared.open(URL(string: "https://omega-r.ru")!)
    }
    
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
        Button("Share with") {
            isSharePresented = true
        }
        .sheet(isPresented: $isSharePresented) {
            ActivityView(activityItems: ["Поделиться информацией с помощью"], applicationActivities: [telegramActivity, whatsAppActivity])
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
        guard let urlShare = URL(string: "https://omega-r.ru") else { return }
        let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
}
