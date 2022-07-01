//
//  UIApplication + extension.swift
//  City Guide
//
//  Created by Omega on 30.06.2022.
//

import UIKit

extension UIApplication {
  func endEditing() {
    sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
