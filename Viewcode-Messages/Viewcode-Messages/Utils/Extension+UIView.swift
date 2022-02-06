//
//  Extension+UIView.swift
//  Viewcode-Messages
//
//  Created by Kaique Lopes de Oliveira on 31/01/22.
//

import Foundation
import UIKit

extension UIView{
    func pin(to superview: UIView){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
    }
}
