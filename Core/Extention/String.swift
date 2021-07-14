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
}
