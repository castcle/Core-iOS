//  Copyright (c) 2021, Castcle and/or its affiliates. All rights reserved.
//  DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
//
//  This code is free software; you can redistribute it and/or modify it
//  under the terms of the GNU General Public License version 3 only, as
//  published by the Free Software Foundation.
//
//  This code is distributed in the hope that it will be useful, but WITHOUT
//  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
//  FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
//  version 3 for more details (a copy is included in the LICENSE file that
//  accompanied this code).
//
//  You should have received a copy of the GNU General Public License version
//  3 along with this work; if not, write to the Free Software Foundation,
//  Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
//
//  Please contact Castcle, 22 Phet Kasem 47/2 Alley, Bang Khae, Bangkok,
//  Thailand 10160, or visit www.castcle.com if you need additional information
//  or have any questions.
//
//  Font.swift
//  Core
//
//  Created by Castcle Co., Ltd. on 7/7/2564 BE.
//

import UIKit

public extension UIFont {

    // load framework font in application
    static let loadAllFonts: () = {
        registerFont(withFilenameString: "Kanit-Bold.ttf", bundle: ConfigBundle.core)
        registerFont(withFilenameString: "Kanit-Light.ttf", bundle: ConfigBundle.core)
        registerFont(withFilenameString: "Kanit-Medium.ttf", bundle: ConfigBundle.core)
        registerFont(withFilenameString: "Kanit-Regular.ttf", bundle: ConfigBundle.core)
        registerFont(withFilenameString: "Sarabun-Bold.ttf", bundle: ConfigBundle.core)
        registerFont(withFilenameString: "Sarabun-Medium.ttf", bundle: ConfigBundle.core)
        registerFont(withFilenameString: "Sarabun-Regular.ttf", bundle: ConfigBundle.core)
        registerFont(withFilenameString: "Sarabun-Light.ttf", bundle: ConfigBundle.core)
        registerFont(withFilenameString: "Sarabun-LightItalic.ttf", bundle: ConfigBundle.core)
        registerFont(withFilenameString: "Castcle.ttf", bundle: ConfigBundle.core)
    }()

    static let checkFont: () = {
        for family: String in UIFont.familyNames {
            print(family)
            for names: String in UIFont.fontNames(forFamilyName: family) {
                print("== \(names)")
            }
        }
    }()

    // MARK: - Make custom font bundle register to framework
    static func registerFont(withFilenameString filenameString: String, bundle: Bundle) {

        guard let pathForResourceString = bundle.path(forResource: filenameString, ofType: nil) else {
            print("UIFont+: Failed to register font - path for resource not found.")
            return
        }

        guard let fontData = NSData(contentsOfFile: pathForResourceString) else {
            print("UIFont+: Failed to register font - font data could not be loaded.")
            return
        }

        guard let dataProvider = CGDataProvider(data: fontData) else {
            print("UIFont+: Failed to register font - data provider could not be loaded.")
            return
        }

        guard let font = CGFont(dataProvider) else {
            print("UIFont+: Failed to register font - font could not be loaded.")
            return
        }

        var errorRef: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &errorRef) {
            print("UIFont+: Failed to register font - register graphics font failed - this font may have already been registered in the main bundle.")
        }
    }

    enum Fonts: String, CaseIterable {
        case bold = "Kanit-Bold"
        case light = "Kanit-Light"
        case medium = "Kanit-Medium"
        case regular = "Kanit-Regular"
        case contentBold = "Sarabun-Bold"
        case contentMedium = "Sarabun-Medium"
        case contentRegular = "Sarabun-Regular"
        case contentLight = "Sarabun-Light"
        case contentLightItalic = "Sarabun-LightItalic"
        case castcleIcon = "untitled-font-1"
    }

    enum FontSize {
        case title
        case head1
        case head2
        case head3
        case head4
        case head5
        case body
        case overline
        case small
        case custom(size: CGFloat)

        var value: CGFloat {
            switch self {
            case .title:
                return 30
            case .head1:
                return 30
            case .head2:
                return 24
            case .head3:
                return 20
            case .head4:
                return 18
            case .head5:
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
