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
//  Page.swift
//  Core
//
//  Created by Castcle Co., Ltd. on 27/10/2564 BE.
//

import RealmSwift
import SwiftyJSON

public class Page: Object {

    @objc dynamic public var id: String = ""
    @objc dynamic public var castcleId: String = ""
    @objc dynamic public var displayName: String = ""
    @objc dynamic public var avatar: String = ""
    @objc dynamic public var cover: String = ""
    @objc dynamic public var overview: String = ""
    @objc dynamic public var official: Bool = false
    @objc dynamic public var isSyncTwitter: Bool = false
    @objc dynamic public var isSyncFacebook: Bool = false

    public override static func primaryKey() -> String? {
        return "castcleId"
    }

    public func initCustom(id: String = "", displayName: String = "", castcleId: String = "", avatar: String = "", cover: String = "", overview: String = "", official: Bool = false) -> Page {
        let page = Page()
        page.id = id
        page.displayName = displayName
        page.castcleId = castcleId
        page.avatar = avatar
        page.cover = cover
        page.overview = overview
        page.official = official
        return page
    }
}
