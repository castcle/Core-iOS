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
//  CommentRef.swift
//  Core
//
//  Created by Castcle Co., Ltd. on 12/4/2565 BE.
//

import RealmSwift
import SwiftyJSON

public class CommentRef: Object {
    @objc dynamic public var id = ""
    @objc dynamic public var message = ""
    @objc dynamic public var authorId = ""
    @objc dynamic public var likeCount = 0
    @objc dynamic public var liked = false
    @objc dynamic public var createdAt = ""
    @objc dynamic public var updatedAt = ""

    public override static func primaryKey() -> String? {
        return "id"
    }

    public var commentDate: Date {
        return Date.stringToDate(str: self.createdAt)
    }

    public func initCustom(json: JSON) -> CommentRef {
        let commentRef = CommentRef()
        commentRef.id = json[JsonKey.id.rawValue].stringValue
        commentRef.message = json[JsonKey.message.rawValue].stringValue
        commentRef.authorId = json[JsonKey.author.rawValue].stringValue
        commentRef.createdAt = json[JsonKey.createdAt.rawValue].stringValue
        commentRef.updatedAt = json[JsonKey.updatedAt.rawValue].stringValue

        // MARK: - Metric
        let metricJson = JSON(json[JsonKey.metrics.rawValue].dictionaryValue)
        commentRef.likeCount = metricJson[JsonKey.likeCount.rawValue].intValue

        // MARK: - Participate
        let participateJson = JSON(json[JsonKey.participate.rawValue].dictionaryValue)
        commentRef.liked = participateJson[JsonKey.liked.rawValue].boolValue

        return commentRef
    }
}
