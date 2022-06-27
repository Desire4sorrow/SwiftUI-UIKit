//
//  CityObjectsView.swift
//  City Guide
//
//  Created by Omega on 17.06.2022.
//

import SwiftUI

struct CityObjectsView: View {
    @State var isSelected = false

    var objectsViewModel: ObjectsViewModel
    
    init(objectsViewModel: ObjectsViewModel) {
        self.objectsViewModel = objectsViewModel
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some View {
            List(objectsViewModel.cityObjects) { object in
                NavigationLink {
                    ObjectDescriptionView()
                } label: {
                    HStack {
                        Image(object.objectIcon)
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text(object.objectName)
                        Spacer()
                        Text(object.timeOfWork)
                    }
                }
            }
            .navigationTitle(objectsViewModel.city)
            .navigationBarTitleDisplayMode(.inline)
            .background(
                Image(objectsViewModel.backgroundImage)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
                    .opacity(0.7)
                    .blur(radius: 5)
            )
    }
}
