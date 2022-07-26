//
//  Object.swift
//  City Guide
//
//  Created by Omega on 23.06.2022.
//

import Foundation
import UIKit

struct Object: Identifiable {
    let id: Int
    let objectIcon: String
    let objectName: String
    let timeOfWork: String
    let objectDescription: String
    let reachInfo: [ReachInfo]
}
