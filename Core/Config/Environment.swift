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
}
