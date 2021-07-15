//
//  String.swift
//  Core
//
//  Created by Tanakorn Phoochaliaw on 2/7/2564 BE.
//

import Defaults

public extension String {

    var dataEncoded: Data {
        return self.data(using: String.Encoding.utf8)!
    }
    
    func localized(withComment comment: String = "", bundle: Bundle) -> String {
        let path = bundle.path(forResource: Defaults[.appLanguage], ofType: "lproj")!
        let languageBundle = Bundle (path: path)!
        return NSLocalizedString(self, bundle: languageBundle, comment: comment)
    }
    
    static func displayCount(count: Int) -> String {
        if count > 1000000 {
            let show = Int(count / 1000000)
            return "\(show)M"
        } else if count > 1000 {
            let show = Int(count / 1000)
            return "\(show)K"
        } else {
            return "\(count)"
        }
    }
}
