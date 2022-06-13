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
//  ApiHelper.swift
//  Core
//
//  Created by Castcle Co., Ltd. on 9/8/2564 BE.
//

import UIKit
import DeviceKit
import Defaults
import SwiftIP
import SwiftyJSON

public struct ApiHelper {
    public static let errorResponse: Data = "{\"code\" : \"9999\", \"statusCode\" : \"500\", \"message\" : \"Sorry, Internal server error.\"}".data(using: .utf8) ?? Data()

    public static func header(version: String = "") -> [String: String] {
        let publicIP: String = IP.public() ?? APIs.defualtIpAddress
        var param: [String: String] = [
            "Content-Type": "application/json",
            "Device": "\(Device.current)",
            "Accept-Language": Defaults[.appLanguage],
            "Platform": "iOS",
            "Authorization": "Bearer \(UserManager.shared.accessToken)",
            "API-Metadata": "ip=\(publicIP.trimmingCharacters(in: .whitespacesAndNewlines)),src=iOS,dest=castcle"
        ]
        if !version.isEmpty {
            param["Accept-Version"] = version
        }
        return param
    }

    public static func headerRefreshToken(version: String = "") -> [String: String] {
        let publicIP: String = IP.public() ?? APIs.defualtIpAddress
        var param: [String: String] = [
            "Content-Type": "application/json",
            "Device": "\(Device.current)",
            "Accept-Language": Defaults[.appLanguage],
            "Platform": "iOS",
            "Authorization": "Bearer \(UserManager.shared.refreshToken)",
            "API-Metadata": "ip=\(publicIP.trimmingCharacters(in: .whitespacesAndNewlines)),src=iOS,dest=castcle"
        ]
        if !version.isEmpty {
            param["Accept-Version"] = version
        }
        return param
    }

    public static func displayError(code: String = "", error: String = "Something Went wrong") {
        let alert = UIAlertController(title: "Error" + (code.isEmpty ? "" : " (\(code))"), message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        Utility.currentViewController().present(alert, animated: true, completion: nil)
    }

    public static func displayMessage(title: String = "", message: String = "") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        Utility.currentViewController().present(alert, animated: true, completion: nil)
    }

    public static func loadPath() {
        if let path = ConfigBundle.core.path(forResource: "Urls", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let rawJson = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                let json = JSON(rawJson)
                print(json)
                print("=========")
            } catch {}
        }
    }
}
