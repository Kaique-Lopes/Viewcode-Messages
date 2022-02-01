//
//  LoginScreen.swift
//  Login-ViewCode
//
//  Created by Kaique Lopes de Oliveira on 17/11/21.
//

import UIKit
protocol LoginScreenProtocol: AnyObject {
    func actionLoginButton()
    func actionRegisterButton()
}

class LoginScreen: UIView {
    weak var delegate : LoginScreenProtocol?
    
    func delegate(delegate: LoginScreenProtocol) {
        self.delegate = delegate
    }
    
    // MARK: - Create Label Login
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "Login"
        return label
    }()
    
    // MARK: - Create ImageView
    lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        image.tintColor = .green
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    // MARK: - Create TextField
    lazy var emailTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "Digite seu E-mail !")
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .emailAddress
        textField.isSecureTextEntry = false
        return textField
    }()
    
    lazy var passwordTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "Digite sua senha !")
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        return textField
    }()

    // MARK: - Create Button Login
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.backgroundColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.addTarget(self, action: #selector(self.tappedLogin), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Create Button Register
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Não tem conta? Cadastre-se!", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.addTarget(self, action: #selector(self.tappedRegister), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Init Class
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperViews()
        self.configBackgroundColor()
        self.setupConstraints()
        self.configEnable(isOn: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Create function SuperViews
    private func configSuperViews() {
        self.addSubview(loginLabel)
        self.addSubview(logoImageView)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(registerButton)
    }
    
    // MARK: - Create Function BackgroundColor
    private func configBackgroundColor() {
        backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1)
    }
    
    // MARK: - Close Keyboard Delegate
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    @objc private func tappedRegister(){
        self.delegate?.actionRegisterButton()
    }
    
    @objc private func tappedLogin(){
        self.delegate?.actionLoginButton()
    }
    
    func validateTextFields() {

        if !getEmail().isEmpty && !getPassword().isEmpty {
            self.configEnable(isOn: true)
        } else {
            self.configEnable(isOn: false)
        }
        
    }
    
    func configEnable(isOn enable: Bool) {
        if enable {
            self.loginButton.setTitleColor(.black, for: .normal)
            self.loginButton.isEnabled = true
        } else {
            self.loginButton.setTitleColor(.lightGray, for: .normal)
            self.loginButton.isEnabled = false
        }
    }
    
    public func getEmail() -> String {
        return self.emailTextField.text ?? ""
    }
    
    public func getPassword() -> String {
        return self.passwordTextField.text ?? ""
    }
    
    // MARK: - Create Function call constraints
    private func setupConstraints() {
        self.loginLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        self.loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

        
        self.logoImageView.anchor(top: self.loginLabel.bottomAnchor,
                                  left: self.leftAnchor,
                                  right: self.rightAnchor,
                                  paddingTop: 20,
                                  paddingLeft: 60,
                                  paddingRight: 60,
                                  height: 100)
        
        self.emailTextField.anchor(top: self.logoImageView.bottomAnchor,
                                   left: self.leftAnchor,
                                   right: self.rightAnchor,
                                   paddingTop: 20,
                                   paddingLeft: 30,
                                   paddingRight: 30,
                                   height: 45)
        
        self.passwordTextField.anchor(top: self.emailTextField.bottomAnchor,
                                      left: self.emailTextField.leftAnchor,
                                      right: self.emailTextField.rightAnchor,
                                      paddingTop: 20,
                                      height: 45)

        self.loginButton.anchor(top: self.passwordTextField.bottomAnchor,
                                left: self.emailTextField.leftAnchor,
                                right: self.emailTextField.rightAnchor,
                                paddingTop: 20,
                                height: 40)
        
        self.registerButton.anchor(top: self.loginButton.bottomAnchor,
                                   left: self.emailTextField.leftAnchor,
                                   right: self.emailTextField.rightAnchor,
                                   paddingTop: 5)
    }
}
