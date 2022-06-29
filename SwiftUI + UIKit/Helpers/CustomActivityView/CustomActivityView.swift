//
//  CustomActivityView.swift
//  SwiftUI + UIKit
//
//  Created by Omega on 17.06.2022.
//

import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIActivityViewController
    
    public var activityItems: [Any]
    public var applicationActivities: [UIActivity]?
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let vc = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
}
