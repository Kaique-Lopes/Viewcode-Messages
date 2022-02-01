//
//  RegisterViewController.swift
//  Login-ViewCode
//
//  Created by Kaique Lopes de Oliveira on 19/11/21.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    // MARK: - Creating RegisterScreen instance for the viewcontroller to see its methods
    var registerScreen: RegisterScreen?
    var auth: Auth?
    var alert: Alert?
    
    // MARK: - Create The UI Elements
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerScreen?.configTextFieldDelegate(delegate: self)
        self.registerScreen?.delegate(delegate: self)
    }

}
extension RegisterViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.registerScreen?.validateTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

extension RegisterViewController: RegisterScreenProtocol {
    func actionRegisterButton() {
        guard let register = self.registerScreen else {return}
        
        self.auth?.createUser(withEmail: register.getEmail(), password: register.getPassword(), completion: { result, error in
            if error != nil {
                
            } else {
                self.alert?.getAlert(title: "Sucesso", message: "Conta Criada", completion: {
                    self.navigationController?.popViewController(animated: true)
                    
                })
            }
        })
    }
}
