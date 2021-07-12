//
//  Color.swift
//  Core
//
//  Created by Tanakorn Phoochaliaw on 7/7/2564 BE.
//

import UIKit

public extension UIColor {
    
    struct Asset {
        public static let black = UIColor(named: "Black", in: ConfigBundle.core, compatibleWith: nil)!
        public static let darkGraphiteBlue = UIColor(named: "DarkGraphiteBlue", in: ConfigBundle.core, compatibleWith: nil)!
        public static let darkGray = UIColor(named: "DarkGray", in: ConfigBundle.core, compatibleWith: nil)!
        public static let gray = UIColor(named: "Gray", in: ConfigBundle.core, compatibleWith: nil)!
        public static let lightBlue = UIColor(named: "LightBlue", in: ConfigBundle.core, compatibleWith: nil)!
        public static let lightGray = UIColor(named: "LightGray", in: ConfigBundle.core, compatibleWith: nil)!
        public static let white = UIColor(named: "White", in: ConfigBundle.core, compatibleWith: nil)!
    }
}

public extension UIColor {
    convenience init?(hexString: String) {
        
        if hexString.hasPrefix("#") {
            var hexColor: String = hexString.replacingOccurrences(of: "#", with: "")
            if hexColor.count == 6 {
                hexColor = "\(hexColor)FF"
            }
            
            if hexColor.count == 8 {
                let scanner: Scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    let red: UInt64 = ((hexNumber & 0xff000000) >> 24)
                    let green: UInt64 = ((hexNumber & 0x00ff0000) >> 16)
                    let blue: UInt64 = ((hexNumber & 0x0000ff00) >> 8)
                    let alpha: UInt64 = (hexNumber & 0x000000ff)
                    
                    self.init(
                        red: CGFloat(red) / 255.0,
                        green: CGFloat(green) / 255.0,
                        blue: CGFloat(blue) / 255.0,
                        alpha: CGFloat(alpha) / 255.0)
                    
                    return
                }
            }
        }
        
        return nil
    }
}
