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

    case alignJustify
    case logo
    case search
    case feed
    case next
    case friend
    case arowDown
    case verify
    case like
    case comment
    case recast
    case ellipsisV
    case back
    case info
    case direct
    case global
    case add
    case gif
    case video
    case image
    case text
    case head
    case step
    case pencil
    case blod
    case link
    case leftBack
    case rightBack
    case bell
    case profile
    case privacy
    case language
    case aboutUs
    case addWithCircle
    case checkmark
    case microphone
    case delete
    case related
    case farm
    case coin
    case airdropBalloon
    case airdropBox
    case notification
    case sms
    case mail
    case remind
    case settings
    case message
    case group
    case messenger
    case lightMode
    case switchAccount
    case share
    case blockedUsers
    case cellularDataUse
    case browsing
    case region
    case translationForPosts
    case manageAppPermissions
    case download
    case publicPost
    case tag
    case face
}

private let castcleIcons = [
    "\u{0061}" , // alignJustify
    "\u{0062}" , // logo
    "\u{0063}" , // search
    "\u{0064}" , // feed
    "\u{0065}" , // next
    "\u{0066}" , // friend
    "\u{0067}" , // arowDown
    "\u{0068}" , // verify
    "\u{0069}" , // like
    "\u{006A}" , // comment
    "\u{006B}" , // recast
    "\u{006C}" , // ellipsisV
    "\u{006D}" , // back
    "\u{006E}" , // info
    "\u{006F}" , // direct
    "\u{0070}" , // global
    "\u{0071}" , // add
    "\u{0072}" , // gif
    "\u{0073}" , // video
    "\u{0074}" , // image
    "\u{0075}" , // text
    "\u{0076}" , // head
    "\u{0077}" , // step
    "\u{0078}" , // pencil
    "\u{0079}" , // blod
    "\u{007A}" , // link
    "\u{0041}" , // leftBack
    "\u{0042}" , // rightBack
    "\u{0043}" , // bell
    "\u{0044}" , // profile
    "\u{0045}" , // privacy
    "\u{0046}" , // language
    "\u{0047}" , // aboutUs
    "\u{0048}" , // addWithCircle
    "\u{0049}" , // checkmark
    "\u{004A}" , // microphone
    "\u{004B}" , // delete
    "\u{004C}" , // related
    "\u{004D}" , // farm
    "\u{004E}" , // coin
    "\u{004F}" , // airdropBalloon
    "\u{0050}" , // airdropBox
    "\u{0051}" , // notification
    "\u{0052}" , // sms
    "\u{0053}" , // mail
    "\u{0054}" , // remind
    "\u{0055}" , // settings
    "\u{0056}" , // message
    "\u{0057}" , // group
    "\u{0058}" , // messenger
    "\u{0059}" , // lightMode
    "\u{005A}" , // switchAccount
    "\u{0030}" , // share
    "\u{0031}" , // blockedUsers
    "\u{0032}" , // cellularDataUse
    "\u{0033}" , // browsing
    "\u{0034}" , // region
    "\u{0035}" , // translationForPosts
    "\u{0036}" , // manageAppPermissions
    "\u{0037}" , // download
    "\u{0038}" , // publicPost
    "\u{0039}" , // tag
    "\u{0021}" // face
]
