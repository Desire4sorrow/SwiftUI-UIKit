//
//  BaseViewController.swift
//  City Guide
//
//  Created by Omega on 22.07.2022.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    func configureUI() {
        prepareBackButton()
        prepareNavigationBar()
    }

    func prepareBackButton() {
        guard let navigationStack = navigationController?.viewControllers, navigationStack.count > 1 else {
            return
        }
        setupLeftButton()
    }

    func prepareNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }

    func setupLeftButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "back-arrow")!,
            style: .plain ,
            target: self,
            action: #selector(back)
        )
    }

    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
}
