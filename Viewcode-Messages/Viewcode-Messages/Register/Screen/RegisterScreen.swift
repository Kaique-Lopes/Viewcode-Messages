//
//  RegisterScreen.swift
//  Login-ViewCode
//
//  Created by Kaique Lopes de Oliveira on 20/11/21.
//

import UIKit

protocol RegisterScreenProtocol: AnyObject {
    func actionRegisterButton()
}

class RegisterScreen: UIView {
    
    weak private var delegate: RegisterScreenProtocol?
    
    func delegate(delegate: RegisterScreenProtocol){
        self.delegate = delegate
    }
    lazy var nameTextField: CustomTextField = {
        var tf = CustomTextField(placeholder: "Digite seu nome")
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = .emailAddress
        tf.keyboardAppearance = .dark
        return tf
    }()
    lazy var imageAddUser: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "usuario")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var emailTextField: CustomTextField = {
        var tf = CustomTextField(placeholder: "Digite seu e-mail")
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = .emailAddress
        tf.keyboardAppearance = .dark
        return tf
    }()
    
    lazy var passwordTextField: CustomTextField = {
        let tf = CustomTextField(placeholder: "Digite sua senha !")
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = .default
        tf.isSecureTextEntry = false
        return tf
    }()
    
    lazy var registerButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackgroundColor()
        self.configSuperView()
        self.setupConstraints()
        self.configButtonEnable(on: false)
    }
    
    // MARK: - Create Function BackgroundColor
    private func configBackgroundColor() {
        backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1)
    }
    
    // MARK: - addsubviews
    func configSuperView() {
        self.addSubview(self.imageAddUser)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.registerButton)
        self.addSubview(self.nameTextField)
    }
    
    // MARK: - Close Keyboard Delegate
    func configTextFieldDelegate(delegate: UITextFieldDelegate){
        self.nameTextField.delegate = delegate
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    @objc private func tappedRegisterButton() {
        self.delegate?.actionRegisterButton()
    }
    
    func validateTextFields() {
        if !getName().isEmpty && !getEmail().isEmpty && !getPassword().isEmpty {
            self.configButtonEnable(on: true)
        } else {
            self.configButtonEnable(on: false)
        }
    }
    
    func configButtonEnable(on enable: Bool){
        if enable {
            self.registerButton.setTitleColor(.black, for: .normal)
            self.registerButton.isEnabled = true
        }else {
            self.registerButton.setTitleColor(.lightGray, for: .normal)
            self.registerButton.isEnabled = false
        }
    }
    
    public func getName() -> String {
        return self.nameTextField.text ?? ""
    }
    
    public func getEmail() -> String {
        return self.emailTextField.text ?? ""
    }
    
    public func getPassword() -> String {
        return self.passwordTextField.text ?? ""
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.imageAddUser.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant:  20),
            self.imageAddUser.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageAddUser.widthAnchor.constraint(equalToConstant: 50),
            self.imageAddUser.heightAnchor.constraint(equalToConstant: 50),
            
            self.nameTextField.topAnchor.constraint(equalTo: self.imageAddUser.bottomAnchor, constant: 10),
            self.nameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.nameTextField.heightAnchor.constraint(equalToConstant: 45),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: 10),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 10),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 45),
            
            self.registerButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20),
            self.registerButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.registerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.registerButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}
