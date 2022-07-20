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
//  RegexpParser.swift
//  Core
//
//  Created by Castcle Co., Ltd. on 27/12/2564 BE.
//

import UIKit

public struct RegexpParser {
    public static let selfMatchesStr: String = "SELF MATCHES %@"
    public static let hashtagPattern: String = "#[^[:punct:][:space:]]+"
    public static let mentionPattern: String = "@[^[:punct:][:space:]]+"
    public static let emailPattern: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    public static let psdPattern: String = "^(?=.*[a-z])(?=.*[A-Z]).{6,}$"
    public static let psdCharPattern: String = "^(?=.*[a-z])(?=.*[A-Z]).{2,}$"
    public static let castcleIdPattern: String = "[A-Za-z0-9]+"
}

public struct AttributedContent {
    public static let all = Style.font(UIFont.asset(.contentLight, fontSize: .body))
    public static let quote = Style.font(UIFont.asset(.contentLight, fontSize: .overline))
    public static let link = Style
        .foregroundColor(UIColor.Asset.lightBlue, .normal)
        .foregroundColor(UIColor.Asset.lightBlue, .highlighted)
}
