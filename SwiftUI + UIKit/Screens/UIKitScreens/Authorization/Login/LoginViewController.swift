//
//  LoginViewController.swift
//  City Guide
//
//  Created by Omega on 20.07.2022.
//

import ORCommonUI_Swift
import UIKit

final class LoginViewController: UIViewController {
    var presenter: LoginPresenterInput!

    @IBOutlet weak var registrationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.or_hideKeyboardWhenTapped()
    }
    @IBAction func onRegistrationButtonTouched() {
        presenter.registrationButtonTouched()
    }
    
}

extension LoginViewController: LoginViewInput {

}
