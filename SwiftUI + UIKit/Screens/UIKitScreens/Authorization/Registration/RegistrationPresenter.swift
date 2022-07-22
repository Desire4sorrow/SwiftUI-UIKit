//
//  RegistrationPresenter.swift
//  City Guide
//
//  Created by Omega on 20.07.2022.
//

import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import Foundation

final class RegistrationPresenter {
    unowned var view: RegistrationViewInput!
    var router: RegistrationRouterInput!
}

// MARK: - RegistrationPresenterInput

extension RegistrationPresenter: RegistrationPresenterInput {

    func registrationButtonTouched(_ fields: RegistrationViewModel) {
        Auth.auth().createUser(withEmail: fields.email, password: fields.password) { result, error in
            if error != nil {
                self.router.showError(error!)
            }
            let db = Firestore.firestore()
            db.collection(AuthFields.dbName).addDocument(data: [
                AuthFields.email: fields.email,
                AuthFields.password: fields.password,
                AuthFields.phone: fields.phone,
                AuthFields.name: fields.name,
                AuthFields.userId: result!.user.uid
            ]) { error in
                if let error = error {
                    self.router.showError(error)
                } else {
                    self.router.showMainScreen(name: fields.name, email: fields.email)
                }
            }
        }
    }
}

// MARK: - RegistrationOutput

extension RegistrationPresenter: RegistrationRouterOutput {

}
