//
//  LoginViewController.swift
//  City Guide
//
//  Created by Omega on 20.07.2022.
//

import ORCommonUI_Swift
import UIKit

final class LoginViewController: UIViewController, UITextFieldDelegate {
    var presenter: LoginPresenterInput!

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registrationButton: UIButton!
    @IBOutlet weak var loginButton: ORButton!

    var isCorrectInput: Bool {
        emailTextField.text!.isValidEmail() && passwordTextField.text!.count >= 6
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.isEnabled = false
        view.or_hideKeyboardWhenTapped()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        addNotificationObserver(name: UITextField.textDidChangeNotification) { [weak self] _ in
            self?.textFieldChanged()
        }

    }

    @IBAction func onLoginButtonTouched() {
        presenter.onLoginTouched(emailTextField.text!, passwordTextField.text!)
    }

    @IBAction func onRegistrationButtonTouched() {
        presenter.registrationButtonTouched()
    }

    private func textFieldChanged() {
        loginButton.isEnabled = isCorrectInput
    }
}

extension LoginViewController: LoginViewInput {

}
