//
//  CityObjectsView.swift
//  City Guide
//
//  Created by Omega on 17.06.2022.
//

import SwiftUI

struct CityObjectsView: View {
    @State var isSelected = false
    var cityObjects = [Objects]()
    
    var body: some View {
        List {
            ForEach(cityObjects) { object in
                HStack {
                    Image(object.objectIcon)
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text(object.objectName)
                    Text(object.timeOfWork)
                }
            }
        }
    }
}
