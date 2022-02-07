//
//  Extension+String.swift
//  Viewcode-Messages
//
//  Created by Kaique Lopes de Oliveira on 01/02/22.
//

import Foundation
import UIKit

extension String {
    func size(offFont font: UIFont) -> CGSize {
        return (self as NSString).size(withAttributes: [NSAttributedString.Key.font : font])
    }
    
    func heigtWithConstraintWidht(widht: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: widht, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font : font], context: nil)
        return boundingBox.height
    }
}
