//
//  CascleFontType.swift
//  Core
//
//  Created by Tanakorn Phoochaliaw on 8/7/2564 BE.
//

public enum CastcleType: Int {
    public static var count: Int {
        return castcleIcons.count
    }

    public var text: String? {
        return castcleIcons[rawValue]
    }

    case alignCenter, alignJustify, batteryFull
}

private let castcleIcons = ["\u{0061}", "\u{0062}", "\u{0063}"]
