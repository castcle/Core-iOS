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
//  TextSize.swift
//  Core
//
//  Created by Castcle Co., Ltd. on 14/7/2564 BE.
//

import UIKit

public struct TextSize {
    private struct CacheEntry: Hashable, Equatable {
        let text: String
        let font: UIFont
        let width: CGFloat
        let insets: UIEdgeInsets

        func hash(into hasher: inout Hasher) {
            hasher.combine(text)
            hasher.combine(width)
            hasher.combine(insets.top)
            hasher.combine(insets.left)
            hasher.combine(insets.bottom)
            hasher.combine(insets.right)
        }

        static func == (lhs: TextSize.CacheEntry, rhs: TextSize.CacheEntry) -> Bool {
            return lhs.width == rhs.width && lhs.insets == rhs.insets && lhs.text == rhs.text
        }
    }

    private static var cache: [CacheEntry: CGRect] = [:] {
        didSet {
            assert(Thread.isMainThread)
        }
    }

    public static func size(_ text: String, font: UIFont, width: CGFloat, insets: UIEdgeInsets = .zero) -> CGRect {
        let key = CacheEntry(text: text, font: font, width: width, insets: insets)
        if let hit = cache[key] {
            return hit
        }

        let constrainedSize = CGSize(width: width - insets.left - insets.right, height: .greatestFiniteMagnitude)
        let attributes = [NSAttributedString.Key.font: font]
        let options: NSStringDrawingOptions = [.usesFontLeading, .usesLineFragmentOrigin]
        var bounds = (text as NSString).boundingRect(with: constrainedSize, options: options, attributes: attributes, context: nil)
        bounds.size.width = width
        bounds.size.height = ceil(bounds.height + insets.top + insets.bottom)
        cache[key] = bounds
        return bounds
    }
}
