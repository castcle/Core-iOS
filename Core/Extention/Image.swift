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
//  Image.swift
//  Core
//
//  Created by Castcle Co., Ltd. on 12/7/2564 BE.
//

import UIKit

public extension UIImage {
    struct Asset {
        public static let castcleLogo = UIImage(named: "castcle-logo", in: ConfigBundle.core, compatibleWith: nil)!
        public static let googleLogo = UIImage(named: "google-logo", in: ConfigBundle.core, compatibleWith: nil)!
        public static let launchScreen = UIImage(named: "launch-screen", in: ConfigBundle.core, compatibleWith: nil)!
        public static let placeholder = UIImage(named: "placeholder", in: ConfigBundle.core, compatibleWith: nil)!
        public static let userPlaceholder = UIImage(named: "user-placeholder", in: ConfigBundle.core, compatibleWith: nil)!
        public static let typeCastIcon = UIImage(named: "type-cast-icon", in: ConfigBundle.core, compatibleWith: nil)!
        public static let typePageIcon = UIImage(named: "type-page-icon", in: ConfigBundle.core, compatibleWith: nil)!

        // MARK: - Web Icon
        public static let rssfeed = UIImage(named: "rssfeed", in: ConfigBundle.core, compatibleWith: nil)!
        public static let twitter = UIImage(named: "twitter", in: ConfigBundle.core, compatibleWith: nil)!
        public static let youtube = UIImage(named: "youtube", in: ConfigBundle.core, compatibleWith: nil)!
        public static let medium = UIImage(named: "medium", in: ConfigBundle.core, compatibleWith: nil)!
        public static let facebook = UIImage(named: "facebook", in: ConfigBundle.core, compatibleWith: nil)!
        public static let reddit = UIImage(named: "reddit", in: ConfigBundle.core, compatibleWith: nil)!
        public static let web = UIImage(named: "web", in: ConfigBundle.core, compatibleWith: nil)!
    }

    func alpha(_ value: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }

    func toBase64() -> String? {
        guard let imageData = self.pngData() else { return nil }
        return imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
    }

    func resizeImage(targetSize: CGSize) -> UIImage {
        let size = self.size
        if size.width < targetSize.width || size.height < targetSize.height {
            return self
        }

        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height

        var newSize: CGSize
        if widthRatio > heightRatio {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }

        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }

    static func iconFromUrl(url: String) -> UIImage? {
        if url.contains(ConstantUrl.reddit.path) {
            return UIImage.Asset.reddit
        } else if url.contains(ConstantUrl.twitter.path) {
            return UIImage.Asset.twitter
        } else if url.contains(ConstantUrl.twitterShot.path) {
            return UIImage.Asset.twitter
        } else {
            return nil
        }
    }
}

public extension UIImageView {
    func circle(color: UIColor = .clear) {
        layer.cornerRadius = frame.size.height * 0.5
        clipsToBounds = true
        layer.borderWidth = 2.0
        layer.borderColor = color.cgColor
    }
}
