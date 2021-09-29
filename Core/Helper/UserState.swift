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
import JWTDecode
import CryptoKit

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
        return Defaults[.displayName]
    }
    
    public var castcleId: String {
        return "@\(Defaults[.castcleId])"
    }
    
    public var rawCastcleId: String {
        return Defaults[.castcleId]
    }
    
    public var email: String {
        return Defaults[.email]
    }
    
    public var dob: String {
        return Defaults[.dob]
    }
    
    public var avatar: String {
        return Defaults[.avatar]
    }
    
    public var cover: String {
        return Defaults[.cover]
    }
    
    public var overview: String {
        return Defaults[.overview]
    }
    
    public var verified: Bool {
        return Defaults[.verified]
    }
    
    public var facebookLink: String {
        return Defaults[.facebookLink]
    }
    
    public var twitterLink: String {
        return Defaults[.twitterLink]
    }
    
    public var youtubeLink: String {
        return Defaults[.youtubeLink]
    }
    
    public var mediumLink: String {
        return Defaults[.mediumLink]
    }
    
    public var websiteLink: String {
        return Defaults[.websiteLink]
    }
    
    public var following: String {
        return "\(String.displayCount(count: Defaults[.following])) "
    }
    
    public var followers: String {
        return "\(String.displayCount(count: Defaults[.followers])) "
    }
    
    public var page: [Page] {
        return [
            Page(name: "Manchester United", avatar: "https://seeklogo.com/images/M/manchester-united-logo-F14DA1FCCD-seeklogo.com.png"),
            Page(name: "Manchester City", avatar: "https://upload.wikimedia.org/wikipedia/th/thumb/e/eb/Manchester_City_FC_badge.svg/1200px-Manchester_City_FC_badge.svg.png"),
            Page(name: "Chelsea FC", avatar: "https://upload.wikimedia.org/wikipedia/th/thumb/c/cc/Chelsea_FC.svg/1200px-Chelsea_FC.svg.png"),
            Page(name: "Liverpool FC", avatar: "https://kgo.googleusercontent.com/profile_vrt_raw_bytes_1587515361_10542.jpg")
        ]
    }
    
    public var accountId: String {
        do {
            let jwt = try decode(jwt: Defaults[.accessToken])
            
            let claim = jwt.claim(name: "id")
            if let id = claim.string {
                return id
            } else {
                return ""
            }
        } catch {
            return ""
        }
    }
    
    public var uxSessionId: String {
        do {
            let jwt = try decode(jwt: Defaults[.accessToken])
            
            let claim = jwt.claim(name: "id")
            if let id = claim.string {
                let uxSessionId = "\(id)+\(Date.currentTimeStamp)"
                return MD5(string: uxSessionId)
            } else {
                return ""
            }
        } catch {
            return ""
        }
    }
    
    private func MD5(string: String) -> String {
        let digest = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())
        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
}
