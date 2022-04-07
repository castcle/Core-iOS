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
//  Emum.swift
//  Core
//
//  Created by Castcle Co., Ltd. on 7/4/2565 BE.
//

import UIKit

public enum SocialType: String {
    case facebook
    case twitter
    case google
    case apple
    case unknow
    
    public var display: String {
        switch self {
        case .facebook:
            return "Facebook"
        case .twitter:
            return "Twitter"
        case .google:
            return "Google"
        case .apple:
            return "Apple"
        default:
            return "Unknow"
        }
    }
    
    public var icon: UIImage {
        switch self {
        case .facebook:
            return UIImage.init(icon: .castcle(.facebook), size: CGSize(width: 23, height: 23), textColor: UIColor.Asset.white)
        case .twitter:
            return UIImage.init(icon: .castcle(.twitter), size: CGSize(width: 23, height: 23), textColor: UIColor.Asset.white)
        case .google:
            return UIImage.Asset.googleLogo
        case .apple:
            return UIImage.init(icon: .castcle(.apple), size: CGSize(width: 23, height: 23), textColor: UIColor.Asset.white)
        default:
            return UIImage()
        }
    }
    
    public var color: UIColor {
        switch self {
        case .facebook:
            return UIColor.Asset.facebook
        case .twitter:
            return UIColor.Asset.twitter
        case .google:
            return UIColor.Asset.white
        case .apple:
            return UIColor.Asset.apple
        default:
            return UIColor.clear
        }
    }
}
