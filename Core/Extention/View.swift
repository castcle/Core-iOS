//
//  View.swift
//  Core
//
//  Created by Tanakorn Phoochaliaw on 12/7/2564 BE.
//

import UIKit

public extension UIView {
    func custom(color: UIColor = UIColor.clear, cornerRadius: CGFloat = 0.0, borderWidth: CGFloat = 0.0, borderColor: UIColor = UIColor.clear) {
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
}
