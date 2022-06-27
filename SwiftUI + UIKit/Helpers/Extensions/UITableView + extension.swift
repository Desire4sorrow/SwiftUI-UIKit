//
//  UITableView + extension.swift
//  SwiftUI + UIKit
//
//  Created by Omega on 15.06.2022.
//

import UIKit
import SwiftUI
import Foundation

extension UITableView {
    
    func dequeueCell<T: UITableViewCell>(ofType type: T.Type) -> T {
        return dequeueReusableCell(withIdentifier: T.className) as! T
    }
    
    open func dequeueCell<T: UITableViewCell>(for indexPath: IndexPath, ofType type: T.Type) -> T {
        return dequeueReusableCell(withIdentifier: T.className, for: indexPath) as! T
    }
    
    open func or_registerCellNib(forClass cellClass: AnyClass) {
        let nib = UINib(nibName: String(describing: cellClass), bundle: nil)
        register(nib, forCellReuseIdentifier: String(describing: cellClass))
    }
}
