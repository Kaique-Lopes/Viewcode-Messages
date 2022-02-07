//
//  Extension+Button.swift
//  Viewcode-Messages
//
//  Created by Kaique Lopes de Oliveira on 01/02/22.
//

import Foundation
import UIKit

extension UIButton {
    func touchAnimation(s: UIButton) {
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseInOut) {
            s.transform = CGAffineTransform(scaleX: 0.80, y: 0.80)
        } completion: { finish in
            UIButton.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .curveEaseInOut) {
                s.transform = .identity
            }
        }

    }
}
