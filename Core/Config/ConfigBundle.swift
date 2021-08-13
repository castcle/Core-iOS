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
//  ConfigBundle.swift
//  Core
//
//  Created by Tanakorn Phoochaliaw on 2/7/2564 BE.
//

public struct ConfigBundle {
    public static var mainApp: Bundle = .main
    public static var core: Bundle = Bundle(identifier: "com.castcle.Core")!
    public static var component: Bundle = Bundle(identifier: "com.castcle.Component")!
    public static var feed: Bundle = Bundle(identifier: "com.castcle.Feed")!
    public static var search: Bundle = Bundle(identifier: "com.castcle.Search")!
    public static var authen: Bundle = Bundle(identifier: "com.castcle.Authen")!
    public static var profile: Bundle = Bundle(identifier: "com.castcle.Profile")!
    public static var network: Bundle = Bundle(identifier: "com.castcle.Networking")!
    public static var share: Bundle = Bundle(identifier: "com.castcle.Share")!
}
