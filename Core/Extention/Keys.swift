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
//  Created by Tanakorn Phoochaliaw on 2/7/2564 BE.
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
    
    // Add Social
    static let facebook = Key<String>("facebook", default: "")
    static let twitter = Key<String>("twitter", default: "")
    static let youtube = Key<String>("youtube", default: "")
    static let medium = Key<String>("medium", default: "")
    static let website = Key<String>("website", default: "")
    
    // Engagement
    static let screenId = Key<String>("screenId", default: "")
}
