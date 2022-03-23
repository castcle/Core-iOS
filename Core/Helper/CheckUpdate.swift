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
//  CheckUpdate.swift
//  Core
//
//  Created by Castcle Co., Ltd. on 23/3/2565 BE.
//

import Foundation
import UIKit
import Defaults

public enum VersionError: Error {
    case invalidBundleInfo, invalidResponse
}

public class LookupResult: Decodable {
    var results: [AppInfo]
}

public class AppInfo: Decodable {
    var version: String
    var trackViewUrl: String
}

public class CheckUpdate: NSObject {
    
    public static let shared = CheckUpdate()
    
    public func showUpdate(withConfirmation: Bool) {
        DispatchQueue.global().async {
            self.checkVersion(force : !withConfirmation)
        }
    }
    
    public func isUpdateApp(version: String) -> Bool {
        let current = Defaults[.appVersion]
        let versionCompare = current.compare(version, options: .numeric)
        if versionCompare == .orderedAscending {
            return true
        } else {
            return false
        }
    }
    
    private func checkVersion(force: Bool) {
        _ = getAppInfo { (info, error) in
            if let appStoreAppVersion = info?.version {
                if let error = error {
                    print("error getting app store version: ", error)
                } else if !self.isUpdateApp(version: appStoreAppVersion) {
                    print("Already on the last app version: ", appStoreAppVersion)
                } else {
                    print("Needs update: AppStore Version: \(appStoreAppVersion) > Current version: ", Defaults[.appVersion])
                    DispatchQueue.main.async {
                        let topController: UIViewController = (UIApplication.shared.windows.first?.rootViewController)!
                        topController.showAppUpdateAlert(version: (info?.version)!, force: force, appUrl: (info?.trackViewUrl)!)
                    }
                }
            }
        }
    }
    
    private func getAppInfo(completion: @escaping (AppInfo?, Error?) -> Void) -> URLSessionDataTask? {
        guard let url = URL(string: "http://itunes.apple.com/br/lookup?bundleId=com.castcle.ios.prod") else {
            DispatchQueue.main.async {
                completion(nil, VersionError.invalidBundleInfo)
            }
            return nil
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let error = error { throw error }
                guard let data = data else { throw VersionError.invalidResponse }
                
                let result = try JSONDecoder().decode(LookupResult.self, from: data)
                print(result.results)
                guard let info = result.results.first else {
                    throw VersionError.invalidResponse
                }
                completion(info, nil)
            } catch {
                completion(nil, error)
            }
        }
        
        task.resume()
        return task
    }
}

extension UIViewController {
    @objc fileprivate func showAppUpdateAlert(version : String, force: Bool, appUrl: String) {
        let alertTitle = "New version"
        let alertMessage = "A new version of Castcle is available on AppStore. Update now!"
        
        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        
        if !force {
            let notNowButton = UIAlertAction(title: "Not now", style: .default)
            alertController.addAction(notNowButton)
        }
        
        let updateButton = UIAlertAction(title: "Update", style: .default) { (action:UIAlertAction) in
            guard let url = URL(string: appUrl) else {
                return
            }
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
        
        alertController.addAction(updateButton)
        self.present(alertController, animated: true, completion: nil)
    }
}
