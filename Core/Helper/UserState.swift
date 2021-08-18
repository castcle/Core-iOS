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
//  UserState.swift
//  Core
//
//  Created by Tanakorn Phoochaliaw on 13/8/2564 BE.
//

import Defaults

public struct Page {
    public var name: String = ""
    public var avatar: String = ""
    
    public init(name: String, avatar: String) {
        self.name = name
        self.avatar = avatar
    }
}

public class UserState: NSObject {
    public static let shared = UserState()
    
    public var isLogin: Bool {
        if Defaults[.userRole] == "GUEST" {
            return false
        } else if Defaults[.accessToken].isEmpty {
            return false
        } else {
            return true
        }
    }
    
    public var name: String {
        return "Tommy Cruise"
    }
    
    public var userId: String {
        return "@tommy-cruise"
    }
    
    public var avatar: String {
        return "https://images.mubicdn.net/images/cast_member/2184/cache-2992-1547409411/image-w856.jpg"
    }
    
    public var cover: String {
        return "https://cdn.pixabay.com/photo/2020/02/11/16/25/manarola-4840080_1280.jpg"
    }
    
    public var page: [Page] {
        return [
            Page(name: "Manchester United", avatar: "https://seeklogo.com/images/M/manchester-united-logo-F14DA1FCCD-seeklogo.com.png"),
            Page(name: "Manchester City", avatar: "https://upload.wikimedia.org/wikipedia/th/thumb/e/eb/Manchester_City_FC_badge.svg/1200px-Manchester_City_FC_badge.svg.png"),
            Page(name: "Chelsea FC", avatar: "https://upload.wikimedia.org/wikipedia/th/thumb/c/cc/Chelsea_FC.svg/1200px-Chelsea_FC.svg.png"),
            Page(name: "Liverpool FC", avatar: "https://kgo.googleusercontent.com/profile_vrt_raw_bytes_1587515361_10542.jpg")
        ]
    }
    
    public func login() {
        Defaults[.userRole] = "USER"
        Defaults[.accessToken] = "0000000000"
    }
    
    public func logout() {
        Defaults[.accessToken] = ""
    }
}
