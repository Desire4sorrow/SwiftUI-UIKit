//
//  ErrorRouter.swift
//  City Guide
//
//  Created by Omega on 22.07.2022.
//

import ORCommonUI_Swift
import UIKit

extension ErrorRouter {
    func showError(_ error: Error) {
        view.or_showAlert(
            title: "Ошибка",
            message: error.localizedDescription,
            buttonTitle: "Понятно",
            animated: true
        )
    }
}

protocol ErrorRouter {
    var view: UIViewController! { get }
}
