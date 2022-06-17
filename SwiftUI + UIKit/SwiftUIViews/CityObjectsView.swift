//
//  CityObjectsView.swift
//  City Guide
//
//  Created by Omega on 17.06.2022.
//

import SwiftUI

struct CityObjectsView: View {
    @State var isSelected = false
    
    var body: some View {
        List {
            VStack {
                Button {
                    isSelected = true
                } label: {
                    Text("Bebra")
                }
                
            }
        }
    }
}

struct CityObjectsView_Previews: PreviewProvider {
    static var previews: some View {
        CityObjectsView()
    }
}
