//
//  CustomActivity.swift
//  SwiftUI + UIKit
//
//  Created by Omega on 17.06.2022.
//


import SwiftUI

class CustomActivity: UIActivity {
    var customActivityType: UIActivity.ActivityType
    var activityName: String
    var activityImageName: String
    var customActionWhenTapped: () -> Void
    
    init(title: String, imageName: String, performAction: @escaping () -> Void) {
        self.activityName = title
        self.activityImageName = imageName
        self.customActivityType = UIActivity.ActivityType(rawValue: "Action \(title)")
        self.customActionWhenTapped = performAction
    }
    
    override var activityType: UIActivity.ActivityType? {
        return customActivityType
    }
    
    override var activityTitle: String? {
        return activityName
    }
    
    override class var activityCategory: UIActivity.Category {
        return .share
    }
    
    override var activityImage: UIImage? {
        return UIImage(named: activityImageName)
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return true
    }
    
    override func prepare(withActivityItems activityItems: [Any]) {
        super.prepare(withActivityItems: activityItems)
    }
    
    override func perform() {
        super.perform()
    }
}
