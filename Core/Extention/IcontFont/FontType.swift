//
//  FontType.swift
//  Core
//
//  Created by Tanakorn Phoochaliaw on 8/7/2564 BE.
//

import UIKit

protocol FontProtocol {
    func errorAnnounce() -> String
    func familyName() -> String
    func fileName() -> String
    func fontName() -> String
}

public enum FontType: FontProtocol {
    
    case castcle(CastcleType)
    
    func errorAnnounce() -> String {
        let message = " FONT - not associated with Info.plist when manual installation was performed"
        let fontName = self.fontName().uppercased()
        let errorAnnounce = fontName.appending(message)
        return errorAnnounce
    }
    
    func familyName() -> String {
        var familyName: String
        switch self {
        case .castcle:
            familyName = "iconfont-castcle-12"
        }
        return familyName
    }
    
    func fileName() -> String {
        var fileName: String
        switch self {
        case .castcle:
            fileName = "Castcle"
        }
        return fileName
    }
    
    func fontName() -> String {
        var fontName: String
        switch self {
        case .castcle:
            fontName = "iconfont-castcle-12"
        }
        return fontName
    }
    
    public var text: String? {
        var text: String

        switch self {
        case let .castcle(icon):
            text = icon.text!
        }

        return text
    }
}
