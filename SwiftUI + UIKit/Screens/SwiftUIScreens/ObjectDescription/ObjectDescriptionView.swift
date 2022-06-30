//
//  ObjectDescriptionView.swift
//  City Guide
//
//  Created by Omega on 27.06.2022.
//

import SwiftUI

struct ObjectDescriptionView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var offset: CGFloat = 0
    
    let objectModel: ObjectDescriptionModel
    let maxHeight = UIScreen.main.bounds.height / 2.3
    
    var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image.backArrow
                .foregroundColor(.pink)
        }
    }
    
    var cityImage: some View {
        ZStack {
            Rectangle()
                .cornerRadius(20)
                .foregroundColor(Color.guidePink)
                .blur(radius: 2)
                .shadow(radius: 2)
            HStack {
                Image(objectModel.cityImage)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 40, height: 40)
                Text(objectModel.cityName)
                    .padding(.trailing)
            }
        }
    }
    
    var objectDescriptionText: some View {
        Text(objectModel.object.objectDescription)
            .padding(.horizontal)
            .font(.title3.bold())
            .foregroundColor(.purple)
            .shadow(color: .white, radius: 1, x: 1, y: 1)
            .zIndex(0)
    }
    
    var topBarView: some View {
        GeometryReader { proxy in
            TopBar(offset: $offset,
                   topBarModel: .init(edge: objectModel.topEdge,
                                      object: objectModel.object,
                                      maxHeight: maxHeight))
                .frame(height: getHeaderHeight(), alignment: .bottom)
                .cornerRadius(10)
        }
        .zIndex(1)
        .frame(height: maxHeight)
        .offset(y: -offset)
    }
    
    var bottomButton: some View {
        NavigationLink("Отзывы") {
            FeedbackView()
        }
        .padding(.horizontal, 60)
        .padding(.vertical, 15)
        .font(.callout)
        .background(.purple)
        .foregroundColor(.white)
        .cornerRadius(16)
        .shadow(radius: 3)
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                topBarView
                objectDescriptionText
                bottomButton
                    .padding(.top, 30)
            }
            .modifier(OffsetModifier(offset: $offset))
        }
        .background(
            Image.background
                .opacity(0.5)
                .blur(radius: 10)
        )
        .coordinateSpace(name: "availableScroll")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton, trailing: cityImage)
    }
    
    func getHeaderHeight() -> CGFloat {
        let topHeight = maxHeight + offset
        
        return topHeight > (80 + objectModel.topEdge)
          ? topHeight
          : (80 + objectModel.topEdge)
    }
}
