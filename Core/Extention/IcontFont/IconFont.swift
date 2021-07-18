//
//  IconFont.swift
//  Core
//
//  Created by Tanakorn Phoochaliaw on 8/7/2564 BE.
//

import UIKit

public extension UIImage {
    convenience init(icon: FontType, size: CGSize, textColor: UIColor = .black, backgroundColor: UIColor = .clear) {
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center

        let fontAspectRatio: CGFloat = 1.28571429
        let fontSize = min(size.width / fontAspectRatio, size.height)
        let font = UIFont(name: icon.fontName(), size: fontSize)
        assert(font != nil, icon.errorAnnounce())
        let attributes = [NSAttributedString.Key.font: font!, NSAttributedString.Key.foregroundColor: textColor, NSAttributedString.Key.backgroundColor: backgroundColor, NSAttributedString.Key.paragraphStyle: paragraph]
        let lineHeight = font!.lineHeight
        let attributedString = NSAttributedString(string: icon.text!, attributes: attributes)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        attributedString.draw(in: CGRect(x: 0, y: (size.height - lineHeight) * 0.5, width: size.width, height: lineHeight))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        if let image = image {
            self.init(cgImage: image.cgImage!, scale: image.scale, orientation: image.imageOrientation)
        } else {
            self.init()
        }
    }
}

public extension UILabel {

    /**
     This function sets the icon to UILabel
     
     - Parameter icon: The icon for the UILabel
     - Parameter iconSize: Size of the icon
     - Parameter textColor: Color for the icon
     - Parameter backgroundColor: Background color for the icon
     
     - Since: 1.0.0
     */
    func setIcon(icon: FontType, iconSize: CGFloat, color: UIColor = .black, bgColor: UIColor = .clear) {
        self.setIcons(prefixText: "", prefixTextColor: UIColor.clear, prefixTextFont: self.font, icons: [icon], iconsSize: iconSize, iconsColor: color, bgColor: bgColor, postfixText: "", postfixTextColor: UIColor.clear, postfixTextFont: self.font)
    }

    /**
     This function sets the icons to UILabel
     
     - Parameter icons: The icons array for the UILabel
     - Parameter iconSize: Size of all icons
     - Parameter textColor: Color for all icons
     - Parameter backgroundColor: Background color for all icon
     
     - Since: 1.1.0
     */
    fileprivate func setIcons(prefixText: String, prefixTextColor: UIColor, prefixTextFont: UIFont, icons: [FontType], iconsSize: CGFloat, iconsColor: UIColor, bgColor: UIColor, postfixText: String, postfixTextColor: UIColor, postfixTextFont: UIFont) {
        self.text = nil

        backgroundColor = bgColor
        textAlignment = .center
        attributedText = getAttributedString(prefixText: prefixText, prefixTextColor: prefixTextColor, prefixTextFont: prefixTextFont, icons: icons, iconsSize: iconsSize, iconsColor: iconsColor, postfixText: postfixText, postfixTextColor: postfixTextColor, postfixTextFont: postfixTextFont)
    }

    func setIcons(prefixText: String? = nil, prefixTextFont: UIFont? = nil, prefixTextColor: UIColor? = nil, icons: [FontType], iconColor: UIColor? = nil, postfixText: String? = nil, postfixTextFont: UIFont? = nil, postfixTextColor: UIColor? = nil, iconSize: CGFloat? = nil, bgColor: UIColor? = nil) {
        self.setIcons(prefixText: prefixText ?? "", prefixTextColor: prefixTextColor ?? self.textColor, prefixTextFont: prefixTextFont ?? self.font, icons: icons, iconsSize: iconSize ?? self.font.pointSize, iconsColor: iconColor ?? self.textColor, bgColor: bgColor ?? UIColor.clear, postfixText: postfixText ?? "", postfixTextColor: postfixTextColor ?? self.textColor, postfixTextFont: postfixTextFont ?? self.font)
    }

    /**
     This function sets the icon to UILabel with text around it with different colors
     
     - Parameter prefixText: The text before the icon
     - Parameter prefixTextColor: The color for the text before the icon
     - Parameter icon: The icon
     - Parameter iconColor: Color for the icon
     - Parameter postfixText: The text after the icon
     - Parameter postfixTextColor: The color for the text after the icon
     - Parameter size: Size of the text
     - Parameter iconSize: Size of the icon
     
     - Since: 1.0.0
     */
    func setIcon(prefixText: String, prefixTextColor: UIColor = .black, icon: FontType?, iconColor: UIColor = .black, postfixText: String, postfixTextColor: UIColor = .black, size: CGFloat?, iconSize: CGFloat? = nil) {
        let textFont = self.font.withSize(size ?? self.font.pointSize)
        self.setIcons(prefixText: prefixText, prefixTextColor: prefixTextColor, prefixTextFont: textFont, icons: icon == nil ? [] : [icon!], iconsSize: iconSize ?? self.font.pointSize, iconsColor: iconColor, bgColor: UIColor.clear, postfixText: postfixText, postfixTextColor: postfixTextColor, postfixTextFont: textFont)
    }

    /**
     This function sets the icon to UILabel with text around it with different fonts & colors
     
     - Parameter prefixText: The text before the icon
     - Parameter prefixTextFont: The font for the text before the icon
     - Parameter prefixTextColor: The color for the text before the icon
     - Parameter icon: The icon
     - Parameter iconColor: Color for the icon
     - Parameter postfixText: The text after the icon
     - Parameter postfixTextFont: The font for the text after the icon
     - Parameter postfixTextColor: The color for the text after the icon
     - Parameter iconSize: Size of the icon
     
     - Since: 1.0.0
     */
    func setIcon(prefixText: String, prefixTextFont: UIFont, prefixTextColor: UIColor = .black, icon: FontType?, iconColor: UIColor = .black, postfixText: String, postfixTextFont: UIFont, postfixTextColor: UIColor = .black, iconSize: CGFloat? = nil) {
        self.setIcons(prefixText: prefixText, prefixTextColor: prefixTextColor, prefixTextFont: prefixTextFont, icons: icon == nil ? [] : [icon!], iconsSize: iconSize ?? self.font.pointSize, iconsColor: iconColor, bgColor: UIColor.clear, postfixText: postfixText, postfixTextColor: postfixTextColor, postfixTextFont: prefixTextFont)

    }
}

private func getAttributedString(prefixText: String, prefixTextColor: UIColor, prefixTextFont: UIFont, icons: [FontType], iconsSize: CGFloat, iconsColor: UIColor, postfixText: String, postfixTextColor: UIColor, postfixTextFont: UIFont) -> NSAttributedString {
//    icons.forEach { FontLoader.loadFontIfNeeded(fontType: $0) }
    let iconFonts = icons.map { UIFont(name: $0.fontName(), size: iconsSize) }
    for (index, element) in iconFonts.enumerated() {
        assert(element != nil, icons[index].errorAnnounce())
    }

    let iconsString = icons.reduce("") { $0 + ($1.text ?? "") }
    let resultAttrString = NSMutableAttributedString(string: "\(prefixText)\(iconsString)\(postfixText)")

    //add prefix text attribute
    resultAttrString.addAttributes([
        NSAttributedString.Key.font: prefixTextFont,
        NSAttributedString.Key.foregroundColor: prefixTextColor
        ], range: NSRange(location: 0, length: prefixText.count))

    //add icons attribute
    resultAttrString.addAttribute(NSAttributedString.Key.foregroundColor, value: iconsColor, range: NSRange(location: prefixText.count, length: iconsString.count))
    for (index, _) in icons.enumerated() {
        resultAttrString.addAttribute(NSAttributedString.Key.font, value: iconFonts[index]!, range: NSRange(location: prefixText.count + index, length: 1))
    }

    //add postfix text attribute
    if !postfixText.isEmpty {
        resultAttrString.addAttributes([
            NSAttributedString.Key.font: postfixTextFont,
            NSAttributedString.Key.foregroundColor: postfixTextColor
            ], range: NSRange(location: prefixText.count + iconsString.count, length: postfixText.count))
    }

    return resultAttrString
}
