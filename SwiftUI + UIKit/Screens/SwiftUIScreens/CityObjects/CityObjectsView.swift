//
//  CityObjectsView.swift
//  City Guide
//
//  Created by Omega on 17.06.2022.
//

import BottomSheet
import Introspect
import SwiftUI

struct CityObjectsView: View {
    @State private var needShowDarkTheme = false
    @State private var isSheetPresented = false
    @State private var currentObject: Object?

    @Environment(\.presentationMode) var presentationMode

    var objectsViewModel: ObjectsViewModel

    init(objectsViewModel: ObjectsViewModel) {
        self.objectsViewModel = objectsViewModel

        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear

        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        UINavigationBar.appearance().standardAppearance = coloredAppearance
    }

    var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image.backArrow
                .foregroundColor(needShowDarkTheme ? .white : .pink)
        }
    }

    var themeButton: some View {
        Button {
            needShowDarkTheme = !needShowDarkTheme
        } label: {
            needShowDarkTheme ? Image(systemName: "sun.max.fill") : Image(systemName: "powersleep")
        }
        .foregroundColor(needShowDarkTheme ? .white : .purple)
    }

    var backgroundImage: some View {
        Image(objectsViewModel.backgroundImage)
            .resizable()
            .edgesIgnoringSafeArea(.all)
            .scaledToFill()
            .opacity(0.7)
            .brightness(needShowDarkTheme ? -0.7 : 0)
            .blur(radius: 5)
    }

    var objectsTable: some View {
        List(objectsViewModel.cityObjects) { object in
            NavigationLink {
                PurposalLinkCell(object: object, viewModel: objectsViewModel)
            } label: {
                HStack {
                    Image(object.objectIcon)
                        .resizable()
                        .frame(width: 80, height: 80)
                        .brightness(needShowDarkTheme ? 0 : -0.1)
                    Text(object.objectName)
                    Spacer()
                    Text(object.timeOfWork)
                }
            }
            .onLongPressGesture {
                isSheetPresented = true
                currentObject = object
            }
            .padding(.trailing, 10)
            .background(needShowDarkTheme ? Color.white : Color.guidePink.opacity(0.7))
            .cornerRadius(16)
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets(.init(
                top: 10,
                leading: 0,
                bottom: 10,
                trailing: 0
            )))
        }
        .padding(.top, 5)
    }

    var body: some View {
        objectsTable
            .navigationBarTitleDisplayMode(.inline)
            .background(backgroundImage)
            .shadow(radius: 3)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton, trailing: themeButton)
            .introspectViewController { nav in
                nav.navigationItem.title = objectsViewModel.city
            }
            .bottomSheet(
                isPresented: $isSheetPresented,
                detents: [.medium(), .large()],
                isModalInPresentation: true
            ) {
                SheetView(object: currentObject!)
            }
    }
}
