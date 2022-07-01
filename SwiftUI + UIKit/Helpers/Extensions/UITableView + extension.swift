//
//  UITableView + extension.swift
//  SwiftUI + UIKit
//
//  Created by Omega on 15.06.2022.
//

import Foundation
import SwiftUI
import UIKit

extension UITableView {
    func dequeueCell<T: UITableViewCell>(ofType _: T.Type) -> T {
        dequeueReusableCell(withIdentifier: T.className) as! T
    }

    open func dequeueCell<T: UITableViewCell>(for indexPath: IndexPath, ofType _: T.Type) -> T {
        dequeueReusableCell(withIdentifier: T.className, for: indexPath) as! T
    }

    open func or_registerCellNib(forClass cellClass: AnyClass) {
        let nib = UINib(nibName: String(describing: cellClass), bundle: nil)
        register(nib, forCellReuseIdentifier: String(describing: cellClass))
    }
}
