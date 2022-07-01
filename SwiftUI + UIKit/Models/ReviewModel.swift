//
//  ReviewModel.swift
//  City Guide
//
//  Created by Omega on 01.07.2022.
//

import Foundation

struct ReviewModel: Codable, Identifiable {
    let id: Int
    let name: String
    let mark: Int
    let reviewText: String
}
