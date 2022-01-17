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
//  UserManager.swift
//  Core
//
//  Created by Castcle Co., Ltd. on 13/8/2564 BE.
//

import Defaults
import CryptoKit
import SwiftyJSON
import UIKit

public enum UserRole: String {
    case user = "USER"
    case guest = "GUEST"
}

public class UserManager: NSObject {
    public static let shared = UserManager()
    
    enum TokenKey: String {
        case id
        case role
        case displayName
        case castcleId
        case verified
        case official
        case mobile
        case email
        case showAds
        case pages
    }
    
    public var isLogin: Bool {
        if Defaults[.userRole] == "GUEST" {
            return false
        } else if Defaults[.accessToken].isEmpty {
            return false
        } else {
            return true
        }
    }
    
    public var accessToken: String {
        return Defaults[.accessToken]
    }
    
    public var refreshToken: String {
        return Defaults[.refreshToken]
    }
    
    public var userRole: UserRole {
        if Defaults[.userRole] == UserRole.user.rawValue {
            return .user
        } else {
            return .guest
        }
    }
    
    public var id: String {
        return Defaults[.userId]
    }
    
    public var displayName: String {
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
    
    public var emailVerified: Bool {
        return Defaults[.verifiedEmail]
    }
    
    public var official: Bool {
        return Defaults[.verifiedOfficial]
    }
    
    public var accountId: String {
        do {
            let payload = self.getJwtBodyString(token: Defaults[.accessToken])
            let payloadData = payload.data(using: String.Encoding.utf8)
            let json = try JSON(data: payloadData!)
            return json[TokenKey.id.rawValue].stringValue
        } catch {
            return ""
        }
    }
    
    public var uxSessionId: String {
        do {
            let payload = self.getJwtBodyString(token: Defaults[.accessToken])
            let payloadData = payload.data(using: String.Encoding.utf8)
            let json = try JSON(data: payloadData!)
            let id = json[TokenKey.id.rawValue].stringValue
            let uxSessionId = "\(id)+\(Date.currentTimeStamp)"
            return MD5(string: uxSessionId)
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
    
    func getJwtBodyString(token: String) -> String {
        let segments = token.components(separatedBy: ".")
        var base64String = segments[1]
        let requiredLength = Int(4 * ceil(Float(base64String.count) / 4.0))
        let nbrPaddings = requiredLength - base64String.count
        if nbrPaddings > 0 {
            let padding = String().padding(toLength: nbrPaddings, withPad: "=", startingAt: 0)
            base64String = base64String.appending(padding)
        }
        base64String = base64String.replacingOccurrences(of: "-", with: "+")
        base64String = base64String.replacingOccurrences(of: "_", with: "/")
        let decodedData = Data(base64Encoded: base64String, options: Data.Base64DecodingOptions(rawValue: UInt(0)))
        let base64Decoded: String = String(data: decodedData! as Data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
        return base64Decoded
    }
    
    public func setAccessToken(token: String) {
        Defaults[.accessToken] = token
    }
    
    public func setRefreshToken(token: String) {
        Defaults[.refreshToken] = token
    }
    
    public func setUserRole(userRole: UserRole) {
        Defaults[.userRole] = userRole.rawValue
    }
}
