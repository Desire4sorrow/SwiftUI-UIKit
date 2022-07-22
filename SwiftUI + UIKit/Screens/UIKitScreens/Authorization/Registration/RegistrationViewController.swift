//
//  RegistrationViewController.swift
//  City Guide
//
//  Created by Omega on 20.07.2022.
//

import ORCommonUI_Swift
import UIKit

final class RegistrationViewController: UIViewController, UITextFieldDelegate {
    var presenter: RegistrationPresenterInput!

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var registrationButton: ORButton!

    var isValidData: Bool {
        emailTextField.text!.isValidEmail() &&
            passwordTextField.text!.count > 5 &&
            phoneTextField.text!.isValidPhoneNumber() &&
            !nameTextField.text!.isEmpty
    }

    lazy var registrationData = RegistrationViewModel(
        email: emailTextField.text!,
        password: passwordTextField.text!,
        phone: phoneTextField.text!,
        name: nameTextField.text!
    )

    override func viewDidLoad() {
        super.viewDidLoad()

        registrationButton.isEnabled = false
        view.or_hideKeyboardWhenTapped()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        addNotificationObserver(name: UITextField.textDidChangeNotification) { [weak self] _ in
            self?.textFieldChanged()
        }
    }

    private func textFieldChanged() {
        registrationButton.isEnabled = isValidData
    }

    @IBAction func onRegistrationButtonTouched() {
        presenter.registrationButtonTouched(registrationData)
    }
}

extension RegistrationViewController: RegistrationViewInput {

}
