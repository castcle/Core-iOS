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
//  Keys.swift
//  Core
//
//  Created by Castcle Co., Ltd. on 2/7/2564 BE.
//

import Defaults

public extension Defaults.Keys {
    static let appVersion = Key<String>("appVersion", default: "")
    static let appBuild = Key<String>("appBuild", default: "")
    static let appLanguage = Key<String>("appLanguage", default: "en")
    static let appLanguageDisplay = Key<String>("appLanguageDisplay", default: "English")
    static let userRole = Key<String>("userRole", default: "")
    static let deviceUuid = Key<String>("deviceUuid", default: "")
    static let accessToken = Key<String>("accessToken", default: "")
    static let refreshToken = Key<String>("refreshToken", default: "")
    static let firebaseToken = Key<String>("firebaseToken", default: "")

    // Feed
    static let startLoadFeed = Key<Bool>("startLoadFeed", default: true)
    static let syncTwitter = Key<Bool>("syncTwitter", default: true)

    // Add Social
    static let facebook = Key<String>("facebook", default: "")
    static let twitter = Key<String>("twitter", default: "")
    static let youtube = Key<String>("youtube", default: "")
    static let medium = Key<String>("medium", default: "")
    static let website = Key<String>("website", default: "")

    // Engagement
    static let screenId = Key<String>("screenId", default: "")
    static let seenId = Key<String>("seenId", default: "")

    // User
    static let userId = Key<String>("userId", default: "")
    static let castcleId = Key<String>("castcleId", default: "")
    static let displayName = Key<String>("displayName", default: "")
    static let avatar = Key<String>("avatar", default: "")
    static let cover = Key<String>("cover", default: "")
    static let overview = Key<String>("overview", default: "")
    static let verifiedEmail = Key<Bool>("verifiedEmail", default: false)
    static let verifiedSocial = Key<Bool>("verifiedSocial", default: false)
    static let verifiedOfficial = Key<Bool>("verifiedOfficial", default: false)
    static let verifiedMobile = Key<Bool>("verifiedMobile", default: false)
    static let email = Key<String>("email", default: "")
    static let dob = Key<String>("dob", default: "")
    static let followers = Key<Int>("followers", default: 0)
    static let following = Key<Int>("following", default: 0)
    static let facebookLink = Key<String>("facebookLink", default: "")
    static let twitterLink = Key<String>("twitterLink", default: "")
    static let youtubeLink = Key<String>("youtubeLink", default: "")
    static let mediumLink = Key<String>("mediumLink", default: "")
    static let websiteLink = Key<String>("websiteLink", default: "")
    static let passwordNotSet = Key<Bool>("passwordNotSet", default: true)
    static let canUpdateCastcleId = Key<Bool>("canUpdateCastcleId", default: false)
    static let mobileCountryCode = Key<String>("mobileCountryCode", default: "")
    static let mobileNumber = Key<String>("mobileNumber", default: "")
    static let badgePage = Key<Int>("badgePage", default: 0)
    static let badgeProfile = Key<Int>("badgeProfile", default: 0)
    static let badgeSystem = Key<Int>("badgeSystem", default: 0)

    // Force update
    static let isForceUpdate = Key<Bool>("isForceUpdate", default: false)
    static let isSoftUpdate = Key<Bool>("isSoftUpdate", default: false)
    static let updateUrl = Key<String>("updateUrl", default: "")
    static let updateTitle = Key<String>("updateTitle", default: "")
    static let updateMessage = Key<String>("updateMessage", default: "")
    static let updateButton = Key<String>("updateButton", default: "")
    static let isFarmingEnable = Key<Bool>("isFarmingEnable", default: false)
}
