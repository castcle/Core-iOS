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
//  CountryCode.swift
//  Core
//
//  Created by Castcle Co., Ltd. on 10/2/2565 BE.
//

import RealmSwift
import SwiftyJSON

public enum CountryCodeKey: String, Codable {
    case code
    case dialCode
    case name
    case flag
}

public class CountryCode: Object {
    @objc dynamic public var code: String = ""
    @objc dynamic public var dialCode: String = ""
    @objc dynamic public var name: String = ""
    @objc dynamic public var flag: String = ""
    
    public override static func primaryKey() -> String? {
        return "code"
    }
    
    public func initWithJson(json: JSON) -> CountryCode {
        let countryCode = CountryCode()
        countryCode.code = json[CountryCodeKey.code.rawValue].stringValue
        countryCode.dialCode = json[CountryCodeKey.dialCode.rawValue].stringValue
        countryCode.name = json[CountryCodeKey.name.rawValue].stringValue
        countryCode.flag = json[CountryCodeKey.flag.rawValue].stringValue
        return countryCode
    }
    
    public func initCustom(code: String, dialCode: String, name: String) -> CountryCode {
        let countryCode = CountryCode()
        countryCode.code = code
        countryCode.dialCode = dialCode
        countryCode.name = name
        return countryCode
    }
}
