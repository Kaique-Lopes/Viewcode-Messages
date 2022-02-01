//
//  CustomTextField.swift
//  Login-ViewCode
//
//  Created by Kaique Lopes de Oliveira on 17/11/21.
//

import UIKit

class CustomTextField: UITextField {
    
    init(placeholder: String){
        super.init(frame: .zero)
        
        let spacer = UIView()
        spacer.setDimensions(height: 50, width: 12)
        leftView = spacer
        leftViewMode = .always
        endEditing(true)
        keyboardAppearance = .dark
        textColor = .black
        font = UIFont.boldSystemFont(ofSize: 16)
        borderStyle = .roundedRect
        autocorrectionType = .no
        backgroundColor = UIColor(white: 1, alpha: 0.1)
        setHeight(height: 50)
        attributedPlaceholder = NSAttributedString(string: placeholder,
                                                   attributes: [.foregroundColor:UIColor(
                                                   white: 1, alpha: 0.6)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
