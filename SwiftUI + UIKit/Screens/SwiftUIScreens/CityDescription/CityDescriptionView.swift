//
//  CityDescriptionView.swift
//  SwiftUI + UIKit
//
//  Created by Omega on 16.06.2022.
//

import BottomSheet
import MapKit
import SwiftUI

struct CityDescriptionView: View {
    let currentCity: City

    @Environment(\.presentationMode) var presentationMode

    @State private var isSharePresented = false
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 95.111,
            longitude: 12.111
        ),
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    )

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
        .foregroundColor(Color.guidePurple)
    }

    var objectsButton: some View {
        NavigationLink("Просмотреть достопримечательности") {
            CityObjectsView(objectsViewModel: .init(
                city: currentCity.cityName,
                backgroundImage: currentCity.cityImage,
                cityObjects: currentCity.cityObjects
            ))
        }
        .padding()
        .background(Color.guidePurpleWithLowOpacity)
        .foregroundColor(.white)
        .cornerRadius(8)
        .shadow(radius: 3)
    }

    var mapsButton: some View {
        Link("Открыть в приложении Яндекс.Карты", destination: URL(string: cityURL)!)
            .padding()
            .background(Color.guidePurpleWithLowOpacity)
            .foregroundColor(.white)
            .cornerRadius(8)
            .shadow(radius: 3)
    }

    var otherObjectsButton: some View {
        NavigationLink("Просмотреть другие объекты рядом") {
            NearestObjectsView(city: currentCity)
        }
        .padding()
        .background(Color.guidePurpleWithLowOpacity)
        .foregroundColor(.white)
        .cornerRadius(8)
        .shadow(radius: 3)
    }
    
    var customScaleButton: some View {
        NavigationLink("Test") {
            CustomScaleView()
        }
        .padding()
        .background(Color.guidePurpleWithLowOpacity)
        .foregroundColor(.white)
        .cornerRadius(8)
        .shadow(radius: 3)
    }

    init(currentCity: City) {
        self.currentCity = currentCity
    }

    var cityView: some View {
        VStack {
            Map(coordinateRegion: $region, showsUserLocation: true)
                .frame(height: 200)
                .shadow(radius: 3)
            Image(currentCity.cityImage)
                .resizable()
                .clipShape(Circle())
                .frame(height: 250)
                .cornerRadius(8)
                .shadow(radius: 3)
            objectsButton
            mapsButton
            otherObjectsButton
            customScaleButton
        }
    }

    var body: some View {
        NavigationView {
            ScrollView {
                cityView
                    .onLoad {
                        updateCurrentRegion()
                    }
                    .onAppear {
                        withAnimation {
                            updateCurrentRegion()
                        }
                    }
                    .padding()
                    .background(Image.background)
                    .navigationTitle(currentCity.cityName)
                    .navigationBarItems(leading: btnBack, trailing: btnShare)
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(.stack)
    }

    func updateCurrentRegion() {
        region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: currentCity.latitude,
                longitude: currentCity.longitude
            ),
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        )
    }

    func actionSheet() {
        guard let urlShare = URL(string: "https://omega-r.ru") else { return }
        let activityVC = UIActivityViewController(
            activityItems: [urlShare],
            applicationActivities: nil
        )

        let scenes = UIApplication.shared.connectedScenes
        let windowScenes = scenes.first as? UIWindowScene
        let currentWindow = windowScenes?.windows.first

        currentWindow?.rootViewController?.present(
            activityVC,
            animated: true,
            completion: nil
        )
    }
}
