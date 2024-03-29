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
//  Notification.swift
//  Core
//
//  Created by Castcle Co., Ltd. on 4/10/2564 BE.
//

import Foundation

public extension Notification.Name {
    static let resetApplication = Notification.Name(rawValue: "resetApplication")
    static let reloadMyContent = Notification.Name(rawValue: "reloadMyContent")
    static let getMyContent = Notification.Name(rawValue: "getMyContent")
    static let getUserInfo = Notification.Name(rawValue: "getUserInfo")
    static let updateProfileDelegate = Notification.Name(rawValue: "updateProfileDelegate")
    static let openProfileDelegate = Notification.Name(rawValue: "openProfileDelegate")
    static let openSearchDelegate = Notification.Name(rawValue: "openSearchDelegate")
    static let openFarmmingDelegate = Notification.Name(rawValue: "openFarmmingDelegate")
    static let openFollerDelegate = Notification.Name(rawValue: "openFollerDelegate")
    static let openCastDelegate = Notification.Name(rawValue: "openCastDelegate")
    static let openCommentDelegate = Notification.Name(rawValue: "openCommentDelegate")
    static let openQuoteCastListDelegate = Notification.Name(rawValue: "openQuoteCastListDelegate")
    static let openSignInDelegate = Notification.Name(rawValue: "openSignInDelegate")
    static let openVerifyDelegate = Notification.Name(rawValue: "openVerifyDelegate")
    static let openRegisterEmailDelegate = Notification.Name(rawValue: "openRegisterEmailDelegate")
    static let openVerifyMobileDelegate = Notification.Name(rawValue: "openVerifyMobileDelegate")
    static let openReportDelegate = Notification.Name(rawValue: "openReportDelegate")
    static let feedScrollToTop = Notification.Name(rawValue: "feedScrollToTop")
    static let feedReloadContent = Notification.Name(rawValue: "feedReloadContent")
    static let resetFeedContent = Notification.Name(rawValue: "resetFeedContent")
    static let syncTwittwerAutoPost = Notification.Name(rawValue: "syncTwittwerAutoPost")

    static func getSearchFeedNotification() -> Notification.Name {
        return Notification.Name(rawValue: "getSearchFeed\(UUID().uuidString)")
    }
}
