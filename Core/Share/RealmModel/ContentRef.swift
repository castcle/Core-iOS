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
//  ContentRef.swift
//  Core
//
//  Created by Castcle Co., Ltd. on 9/1/2565 BE.
//

import RealmSwift
import SwiftyJSON

public class ContentRef: Object {
    @objc dynamic public var id = ""
    @objc dynamic public var authorId = ""
    @objc dynamic public var type = ""
    @objc dynamic public var message = ""
    @objc dynamic public var linkType = ""
    @objc dynamic public var linkUrl = ""
    @objc dynamic public var linkTitle = ""
    @objc dynamic public var linkDesc = ""
    @objc dynamic public var linkImagePreview = ""
    @objc dynamic public var likeCount = 0
    @objc dynamic public var commentCount = 0
    @objc dynamic public var quoteCount = 0
    @objc dynamic public var recastCount = 0
    @objc dynamic public var farmCount = 0
    @objc dynamic public var liked = false
    @objc dynamic public var commented = false
    @objc dynamic public var quoted = false
    @objc dynamic public var recasted = false
    @objc dynamic public var reported = false
    @objc dynamic public var farming = false
    @objc dynamic public var createdAt = ""
    @objc dynamic public var updatedAt = ""
    public var photoThumbnail = List<String>()
    public var photoFullHd = List<String>()

    public override static func primaryKey() -> String? {
        return "id"
    }

    public func initCustom(json: JSON) -> ContentRef {
        let contentRef = ContentRef()
        contentRef.id = json[JsonKey.id.rawValue].stringValue
        contentRef.authorId = json[JsonKey.authorId.rawValue].stringValue
        contentRef.type = json[JsonKey.type.rawValue].stringValue
        contentRef.message = json[JsonKey.message.rawValue].stringValue
        contentRef.createdAt = json[JsonKey.createdAt.rawValue].stringValue
        contentRef.updatedAt = json[JsonKey.updatedAt.rawValue].stringValue

        // MARK: - Link
        let linkArr = json[JsonKey.link.rawValue].arrayValue
        if let linkInfo = linkArr.first {
            contentRef.linkType = linkInfo[JsonKey.type.rawValue].stringValue
            contentRef.linkUrl = linkInfo[JsonKey.url.rawValue].stringValue
            contentRef.linkTitle = linkInfo[JsonKey.title.rawValue].stringValue
            contentRef.linkDesc = linkInfo[JsonKey.description.rawValue].stringValue
            contentRef.linkImagePreview = linkInfo[JsonKey.imagePreview.rawValue].stringValue
        }

        // MARK: - Metric
        let metricJson = JSON(json[JsonKey.metrics.rawValue].dictionaryValue)
        contentRef.likeCount = metricJson[JsonKey.likeCount.rawValue].intValue
        contentRef.commentCount = metricJson[JsonKey.commentCount.rawValue].intValue
        contentRef.quoteCount = metricJson[JsonKey.quoteCount.rawValue].intValue
        contentRef.recastCount = metricJson[JsonKey.recastCount.rawValue].intValue
        contentRef.farmCount = metricJson[JsonKey.farmCount.rawValue].intValue

        // MARK: - Participate
        let participateJson = JSON(json[JsonKey.participate.rawValue].dictionaryValue)
        contentRef.liked = participateJson[JsonKey.liked.rawValue].boolValue
        contentRef.commented = participateJson[JsonKey.commented.rawValue].boolValue
        contentRef.quoted = participateJson[JsonKey.quoted.rawValue].boolValue
        contentRef.recasted = participateJson[JsonKey.recasted.rawValue].boolValue
        contentRef.reported = participateJson[JsonKey.reported.rawValue].boolValue
        contentRef.farming = participateJson[JsonKey.farming.rawValue].boolValue

        // MARK: - Photo
        let photoJson = JSON(json[JsonKey.photo.rawValue].dictionaryValue)
        let photoContent = photoJson[JsonKey.contents.rawValue].arrayValue
        photoContent.forEach { photoInfo in
            contentRef.photoThumbnail.append(photoInfo[JsonKey.thumbnail.rawValue].stringValue)
            contentRef.photoFullHd.append(photoInfo[JsonKey.fullHd.rawValue].stringValue)
        }
        return contentRef
    }
}
