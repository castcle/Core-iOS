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
//  String.swift
//  Core
//
//  Created by Castcle Co., Ltd. on 2/7/2564 BE.
//

import Defaults

public extension String {

    var dataEncoded: Data {
        return self.data(using: String.Encoding.utf8)!
    }
    
    var isEmail: Bool {
        let emailPred = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        return emailPred.evaluate(with: self)
    }
    
    var isPassword: Bool {
        let password = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z]).{6,20}$")
        return password.evaluate(with: self)
    }
    
    func localized(withComment comment: String = "", bundle: Bundle) -> String {
        if let path = bundle.path(forResource: Defaults[.appLanguage], ofType: "lproj"), let languageBundle = Bundle(path: path) {
            return NSLocalizedString(self, bundle: languageBundle, comment: comment)
        } else {
            let path = bundle.path(forResource: "en", ofType: "lproj")!
            let languageBundle = Bundle(path: path)!
            return NSLocalizedString(self, bundle: languageBundle, comment: comment)
        }
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
