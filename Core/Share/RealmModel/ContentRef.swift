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
    @objc dynamic public var liked = false
    @objc dynamic public var commented = false
    @objc dynamic public var quoted = false
    @objc dynamic public var recasted = false
    @objc dynamic public var reported = false
    @objc dynamic public var createdAt = ""
    @objc dynamic public var updatedAt = ""
    public var photoThumbnail = List<String>()
    public var photoFullHd = List<String>()
    
    public override static func primaryKey() -> String? {
        return "id"
    }
    
    public func initCustom(json: JSON) -> ContentRef {
        let contentRef = ContentRef()
        contentRef.id = json["id"].stringValue
        contentRef.authorId = json["authorId"].stringValue
        contentRef.type = json["type"].stringValue
        contentRef.message = json["message"].stringValue
        contentRef.createdAt = json["createdAt"].stringValue
        contentRef.updatedAt = json["updatedAt"].stringValue
        
        // MARK: - Link
        let linkArr = json["link"].arrayValue
        if let linkInfo = linkArr.first {
            contentRef.linkType = linkInfo["type"].stringValue
            contentRef.linkUrl = linkInfo["url"].stringValue
            contentRef.linkTitle = linkInfo["title"].stringValue
            contentRef.linkDesc = linkInfo["description"].stringValue
            contentRef.linkImagePreview = linkInfo["imagePreview"].stringValue
        }
        
        // MARK: - Metric
        let metricJson = JSON(json["metrics"].dictionaryValue)
        contentRef.likeCount = metricJson["likeCount"].intValue
        contentRef.commentCount = metricJson["commentCount"].intValue
        contentRef.quoteCount = metricJson["quoteCount"].intValue
        contentRef.recastCount = metricJson["recastCount"].intValue
        
        // MARK: - Participate
        let participateJson = JSON(json["participate"].dictionaryValue)
        contentRef.liked = participateJson["liked"].boolValue
        contentRef.commented = participateJson["commented"].boolValue
        contentRef.quoted = participateJson["quoted"].boolValue
        contentRef.recasted = participateJson["recasted"].boolValue
        contentRef.reported = participateJson["reported"].boolValue
        
        // MARK: - Photo
        let photoJson = JSON(json["photo"].dictionaryValue)
        let photoContent = photoJson["contents"].arrayValue
        photoContent.forEach { photoInfo in
            contentRef.photoThumbnail.append(photoInfo["thumbnail"].stringValue)
            contentRef.photoFullHd.append(photoInfo["fullHd"].stringValue)
        }
        return contentRef
    }
}
