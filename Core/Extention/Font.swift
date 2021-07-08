//
//  Font.swift
//  Core
//
//  Created by Tanakorn Phoochaliaw on 7/7/2564 BE.
//

import UIKit

public extension UIFont {
    
    // load framework font in application
    static let loadAllFonts: () = {
        registerFont(withFilenameString: "Kanit-Medium.ttf", bundle: ConfigBundle.core)
        registerFont(withFilenameString: "Sarabun-Light.ttf", bundle: ConfigBundle.core)
        registerFont(withFilenameString: "Sarabun-Regular.ttf", bundle: ConfigBundle.core)
        registerFont(withFilenameString: "Cascle-Icon-Font.ttf", bundle: ConfigBundle.core)
    }()
    
    static let checkFont: () = {
        for family: String in UIFont.familyNames {
            print(family)
            for names: String in UIFont.fontNames(forFamilyName: family) {
                print("== \(names)")
            }
        }
    }()

    //MARK: - Make custom font bundle register to framework
    static func registerFont(withFilenameString filenameString: String, bundle: Bundle) {

        guard let pathForResourceString = bundle.path(forResource: filenameString, ofType: nil) else {
            print("UIFont+:  Failed to register font - path for resource not found.")
            return
        }

        guard let fontData = NSData(contentsOfFile: pathForResourceString) else {
            print("UIFont+:  Failed to register font - font data could not be loaded.")
            return
        }

        guard let dataProvider = CGDataProvider(data: fontData) else {
            print("UIFont+:  Failed to register font - data provider could not be loaded.")
            return
        }

        guard let font = CGFont(dataProvider) else {
            print("UIFont+:  Failed to register font - font could not be loaded.")
            return
        }

        var errorRef: Unmanaged<CFError>? = nil
        if (CTFontManagerRegisterGraphicsFont(font, &errorRef) == false) {
            print("UIFont+:  Failed to register font - register graphics font failed - this font may have already been registered in the main bundle.")
        }
    }
    
    enum Fonts: String, CaseIterable {
        case medium = "Kanit-Medium"
        case light = "Sarabun-Light"
        case regular = "Sarabun-Regular"
        case castcleIcon = "untitled-font-1"
    }

    enum FontSize {
        case title
        case h1
        case h2
        case h3
        case h4
        case h5
        case body
        case overline
        case small
        case custom(size: CGFloat)

        var value: CGFloat {
            switch self {
            case .title:
                return 30
            case .h1:
                return 30
            case .h2:
                return 24
            case .h3:
                return 20
            case .h4:
                return 18
            case .h5:
                return 16
            case .body:
                return 16
            case .overline:
                return 14
            case .small:
                return 12
            case .custom(let size):
                return size
            }
        }
    }

    static func asset(_ font: Fonts, fontSize: FontSize) -> UIFont {
        return UIFont(name: font.rawValue, size: fontSize.value)!
    }
}
