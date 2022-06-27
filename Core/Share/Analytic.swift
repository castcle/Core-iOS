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
//  Analytic.swift
//  Core
//
//  Created by Castcle Co., Ltd. on 24/6/2565 BE.
//

// MARK: - Analytic
public class Analytic {
    public var accountId: String = ""
    public var userId: String = ""
    public var channel: String = ""
    public var countryCode: String = ""
    public var role: String = ""

    public init() {
        // Init Analytic
    }

    func toDict() -> [String: String] {
        var param: [String: String] = [:]
        if !self.accountId.isEmpty {
            param["account_id"] = self.accountId
        }
        if !self.userId.isEmpty {
            param["user_id"] = self.userId
        }
        if !self.channel.isEmpty {
            param["channel"] = self.channel
        }
        if !self.countryCode.isEmpty {
            param["country_code"] = self.countryCode
        }
        if !self.role.isEmpty {
            param["role"] = self.role
        }
        return param
    }
}
