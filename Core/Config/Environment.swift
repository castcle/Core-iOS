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
//  Environment.swift
//  Core
//
//  Created by Tanakorn Phoochaliaw on 12/7/2564 BE.
//

import Foundation

public enum Environment {
    // MARK: - Keys
    enum Keys {
        enum Plist {
            static let appEnv = "APP_ENV"
            static let baseUrl = "BASE_URL"
            static let appCenterKey = "APP_CENTER_KEY"
            static let privacyPolicy = "PRIVACY_POLICY"
            static let userAgreement = "USER_AGREEMENT"
            static let docs = "DOCS"
            static let joinUs = "JOIN_US"
            static let whitepaper = "WHITEPAPER"
            static let aboutUs = "ABOUT_US"
        }
    }
    
    // MARK: - Plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = ConfigBundle.core.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    // MARK: - Plist values
    public static let appEnv: EnvironmentType = {
        guard let appEnv = Environment.infoDictionary[Keys.Plist.appEnv] as? String else {
            fatalError("App Env not set in plist for this environment")
        }
        
        if appEnv == EnvironmentType.prod.rawValue {
            return .prod
        } else if appEnv == EnvironmentType.stg.rawValue {
            return .stg
        } else {
            return .dev
        }
    }()
    
    public static let baseUrl: String = {
        guard let baseUrl = Environment.infoDictionary[Keys.Plist.baseUrl] as? String else {
            fatalError("App Env not set in plist for this environment")
        }
        
        return baseUrl
    }()
    
    public static let appCenterKey: String = {
        guard let appCenterKey = Environment.infoDictionary[Keys.Plist.appCenterKey] as? String else {
            fatalError("App Env not set in plist for this environment")
        }
        
        return appCenterKey
    }()
    
    public static let privacyPolicy: String = {
        guard let privacyPolicy = Environment.infoDictionary[Keys.Plist.privacyPolicy] as? String else {
            fatalError("App Env not set in plist for this environment")
        }
        
        return privacyPolicy
    }()
    
    public static let userAgreement: String = {
        guard let userAgreement = Environment.infoDictionary[Keys.Plist.userAgreement] as? String else {
            fatalError("App Env not set in plist for this environment")
        }
        
        return userAgreement
    }()
    
    public static let docs: String = {
        guard let docs = Environment.infoDictionary[Keys.Plist.docs] as? String else {
            fatalError("App Env not set in plist for this environment")
        }
        
        return docs
    }()
    
    public static let joinUs: String = {
        guard let joinUs = Environment.infoDictionary[Keys.Plist.joinUs] as? String else {
            fatalError("App Env not set in plist for this environment")
        }
        
        return joinUs
    }()
    
    public static let whitepaper: String = {
        guard let whitepaper = Environment.infoDictionary[Keys.Plist.whitepaper] as? String else {
            fatalError("App Env not set in plist for this environment")
        }
        
        return whitepaper
    }()
    
    public static let aboutUs: String = {
        guard let aboutUs = Environment.infoDictionary[Keys.Plist.aboutUs] as? String else {
            fatalError("App Env not set in plist for this environment")
        }
        
        return aboutUs
    }()
}
