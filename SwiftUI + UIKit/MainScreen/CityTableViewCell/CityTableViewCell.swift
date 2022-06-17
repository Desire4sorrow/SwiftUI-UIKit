//
//  CityTableViewCell.swift
//  SwiftUI + UIKit
//
//  Created by Omega on 15.06.2022.
//

import Foundation
import UIKit

final class CityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var coordinatesLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    
    func setup(city: City) {
        cityNameLabel.text = city.cityName
        coordinatesLabel.text = "\(city.latitude)  \(city.longitude)"
    }
}
