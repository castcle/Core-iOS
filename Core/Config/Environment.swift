//
//  Environment.swift
//  Castcle-iOS
//
//  Created by Tanakorn Phoochaliaw on 12/7/2564 BE.
//

import Foundation

public enum Environment {
    // MARK: - Keys
    enum Keys {
        enum Plist {
            static let appEnv = "APP_ENV"
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
        
        if appEnv == "PROD" {
            return .prod
        } else if appEnv == "STG" {
            return .stg
        } else {
            return .dev
        }
    }()
}
