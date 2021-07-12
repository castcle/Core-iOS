//
//  Image.swift
//  Core
//
//  Created by Tanakorn Phoochaliaw on 12/7/2564 BE.
//

import UIKit

public extension UIImageView {
    func circle(color: UIColor = .clear) {
        layer.cornerRadius = frame.size.height * 0.5
        clipsToBounds = true
        layer.borderWidth = 2.0
        layer.borderColor = color.cgColor
    }
}
