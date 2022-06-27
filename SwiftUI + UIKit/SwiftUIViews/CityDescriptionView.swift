//
//  CityDescriptionView.swift
//  SwiftUI + UIKit
//
//  Created by Omega on 16.06.2022.
//

import SwiftUI
import MapKit

struct CityDescriptionView: View {
    
    let currentCity: City
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isSharePresented = false
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 95.111,
                                                                                  longitude: 12.111),
                                                   span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    let telegramActivity = CustomActivity(title: "Telegram", imageName: "telegram") {
        UIApplication.shared.open(URL(string: "telegram://send?text=Hello%2C%20World!")!)
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
        .foregroundColor(.pink)
    }
    
    var btnShare: some View {
        Button("Поделиться") {
            isSharePresented = true
        }
        .sheet(isPresented: $isSharePresented) {
            ActivityView(activityItems: ["Share with"], applicationActivities: [telegramActivity])
        }
        .foregroundColor(.purple)
    }
    
    init(currentCity: City) {
        self.currentCity = currentCity
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Map(coordinateRegion: $region, showsUserLocation: true)
                    .frame(height: 200)
                Image(currentCity.cityImage)
                    .resizable()
                    .clipShape(Circle())
                    .frame(height: 300)
                    .cornerRadius(8)
                NavigationLink("Просмотреть достопримечательности") {
                    CityObjectsView(objectsViewModel: .init(city: currentCity.cityName,
                                                            backgroundImage: currentCity.cityImage,
                                                            cityObjects: currentCity.cityObjects))
                }
                .padding()
                .background(Color.purple.opacity(0.7))
                .foregroundColor(Color.white)
                .cornerRadius(8)
                
                Link("Открыть в приложении Яндекс.Карты", destination: URL(string: cityURL)!)
                    .padding()
                    .background(Color.purple.opacity(0.7))
                    .foregroundColor(Color.white)
                    .cornerRadius(8)
            }
            .onLoad {
                region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: currentCity.latitude,
                                                                           longitude: currentCity.longitude),
                                            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
            }
            .onAppear {
                withAnimation {
                    region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: currentCity.latitude,
                                                                               longitude: currentCity.longitude),
                                                span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
                }
            }
            .padding()
            .background(Image("background-image"))
            .navigationTitle(currentCity.cityName)
            .navigationBarItems(leading: btnBack, trailing: btnShare)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    func actionSheet() {
        guard let urlShare = URL(string: "https://omega-r.ru") else { return }
        let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
}
