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
//  AuthorRealm.swift
//  Core
//
//  Created by Castcle Co., Ltd. on 3/12/2564 BE.
//

import RealmSwift
import SwiftyJSON

public class AuthorRealm: Object {
    @objc dynamic public var id = ""
    @objc dynamic public var type = ""
    @objc dynamic public var castcleId = ""
    @objc dynamic public var displayName = ""
    @objc dynamic public var overview = ""
    @objc dynamic public var followed = false
    @objc dynamic public var blocking = false
    @objc dynamic public var blocked = false
    @objc dynamic public var avatar = ""
    @objc dynamic public var official = false

    public override static func primaryKey() -> String? {
        return "id"
    }

    public func initCustom(json: JSON) -> AuthorRealm {
        let authorRef = AuthorRealm()
        authorRef.id = json[JsonKey.id.rawValue].stringValue
        authorRef.type = json[JsonKey.type.rawValue].stringValue
        authorRef.castcleId = json[JsonKey.castcleId.rawValue].stringValue
        authorRef.displayName = json[JsonKey.displayName.rawValue].stringValue
        authorRef.overview = json[JsonKey.overview.rawValue].stringValue
        authorRef.followed = json[JsonKey.followed.rawValue].boolValue
        authorRef.blocking = json[JsonKey.blocking.rawValue].boolValue
        authorRef.blocked = json[JsonKey.blocked.rawValue].boolValue
        let avatarThumbnail = JSON(json[JsonKey.avatar.rawValue].dictionaryValue)
        authorRef.avatar = avatarThumbnail[JsonKey.thumbnail.rawValue].stringValue
        let verified = JSON(json[JsonKey.verified.rawValue].dictionaryValue)
        authorRef.official = verified[JsonKey.official.rawValue].boolValue
        return authorRef
    }
}
