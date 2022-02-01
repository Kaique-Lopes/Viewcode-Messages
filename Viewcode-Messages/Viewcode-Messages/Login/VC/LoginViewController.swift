//
//  ViewController.swift
//  Login-ViewCode
//
//  Created by Kaique Lopes de Oliveira on 17/11/21.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    // MARK: - Instance class LoginScreen, for acess methods
    var loginScreen: LoginScreen?
    var auth: Auth?
    var alert: Alert?
    // MARK: - Ceated loadview method, to load methods from the Class LoginScreen
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.configTextFieldDelegate(delegate: self)
        self.loginScreen?.delegate(delegate: self)
        self.navigationController?.navigationBar.tintColor = .black
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.loginScreen?.validateTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

extension LoginViewController: LoginScreenProtocol{
    func actionLoginButton() {
//        guard let login = self.loginScreen else {return}
//        self.auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { user, error in
//            if error != nil {
//                self.alert?.getAlert(title: "Atenção", message: "Erro ao logar", completion: nil)
//            } else {
//                if user == nil {
//                    self.alert?.getAlert(title: "Atenção", message: "Verifique os dados e tente novamente mais tarde", completion: nil)           } else {
//                        self.alert?.getAlert(title: "Parabéns", message: "Usuario Logado com sucesso", completion: nil)
//                    }
//            }
//        })
        let homeVC: HomeViewController = HomeViewController()
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
    func actionRegisterButton() {
        let registerVC: RegisterViewController = RegisterViewController()
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    
    
}
