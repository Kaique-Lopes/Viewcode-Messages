//
//  NavView.swift
//  Viewcode-Messages
//
//  Created by Kaique Lopes de Oliveira on 13/02/22.
//

import UIKit

enum TypeMessageOrContact {
    case contact
    case message
}

protocol NavViewProtocol: AnyObject {
    func typeScreenMessage(type: TypeMessageOrContact)
}

class NavView: UIView {
    weak private var delegate: NavViewProtocol?
    func delegate(delegate: NavViewProtocol?){
        self.delegate = delegate
    }
    
    lazy var navBackGroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 35
        view.layer.maskedCorners = [.layerMaxXMaxYCorner]
        view.layer.shadowColor = UIColor(white: 0, alpha: 0.02).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 10
        return view
    }()
    
    lazy var navBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var searchBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var searchLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Digite aqui"
        label.font = UIFont(name: CustomFont.poppinsMedium, size: 16)
        label.textColor = .lightGray
        return label
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "search"), for: .normal)
        return button
    }()
    
    lazy var messageButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "message")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .systemPink
        button.addTarget(self, action: #selector(self.tappedMessageButton), for: .touchUpInside)
        return button
    }()
    
    lazy var contactButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "group")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .systemPink
        button.addTarget(self, action: #selector(self.tappedContactButton), for: .touchUpInside)
        return button
    }()
    
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    @objc func tappedMessageButton() {
        self.delegate?.typeScreenMessage(type: .message)
        self.messageButton.tintColor = .systemPink
        self.contactButton.tintColor = .black
    }
    
    @objc func tappedContactButton(){
        self.delegate?.typeScreenMessage(type: .contact)
        self.messageButton.tintColor = .black
        self.contactButton.tintColor = .systemPink
    }
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        self.navBackGroundView.anchor(top: self.topAnchor,
                                      left: self.leftAnchor,
                                      bottom: self.bottomAnchor,
                                      right: self.rightAnchor)
        
        self.navBar.anchor(top: self.safeAreaLayoutGuide.topAnchor,
                           left: self.leftAnchor,
                           bottom: self.bottomAnchor,
                           right: self.rightAnchor)
        
        self.searchBar.anchor(left: self.navBar.leftAnchor,
                              right: self.navBar.rightAnchor,
                              paddingLeft: 30,
                              paddingRight: 20,
                              height: 55)
        //todo centerY
        
        self.stackView.anchor(left: self.navBar.leftAnchor,
                              width: 100,
                              height: 30)
        //todo centerY
        
        self.stackView.anchor(left: self.navBar.leftAnchor,
                              width: 100,
                              height: 30)
        
       // self.stackView.anchor(left: self.messageButton.leftAnchor)

        //self.stackView.anchor(left: self.contactButton.leftAnchor)
        
        self.searchLabel.anchor(left: self.leftAnchor, paddingLeft: 25)
        
        self.searchButton.anchor(right: self.rightAnchor, paddingRight: 20)

    }
}
