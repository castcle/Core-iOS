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
    case youtube
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
    case righProfile
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
    case deleteOne
    case unfollow
    case quoteCast
    case underline
    case italic
    case eraser
    case list
    case addWithCheckmark
    case seeFollowingTopics
    case show
    case edit
    case arowUp
    case notInterested
    case facebook
    case twitter
    case apple
    case email
    case camera
    case cameraLight
    case filter
    case dropDown
    case incorrect
    case arrowObliqueLeft
    case medium
}

private let castcleIcons = [
    "\u{0061}", //case alignJustify
    "\u{0062}", //case logo
    "\u{0063}", //case search
    "\u{0064}", //case feed
    "\u{0065}", //case next
    "\u{0066}", //case friend
    "\u{0067}", //case arowDown
    "\u{0068}", //case verify
    "\u{0069}", //case like
    "\u{006A}", //case comment
    "\u{006B}", //case recast
    "\u{006C}", //case ellipsisV
    "\u{006D}", //case back
    "\u{006E}", //case info
    "\u{006F}", //case direct
    "\u{0070}", //case global
    "\u{0071}", //case add
    "\u{0072}", //case gif
    "\u{0073}", //case youtube
    "\u{0074}", //case image
    "\u{0075}", //case text
    "\u{0076}", //case head
    "\u{0077}", //case step
    "\u{0078}", //case pencil
    "\u{0079}", //case blod
    "\u{007A}", //case link
    "\u{0041}", //case leftBack
    "\u{0042}", //case rightBack
    "\u{0043}", //case bell
    "\u{0044}", //case righProfile
    "\u{0045}", //case privacy
    "\u{0046}", //case language
    "\u{0047}", //case aboutUs
    "\u{0048}", //case addWithCircle
    "\u{0049}", //checkmark
    "\u{004A}", //microphone
    "\u{004B}", //delete
    "\u{004C}", //related
    "\u{004D}", //case farm
    "\u{004E}", //case coin
    "\u{004F}", //case airdropBalloon
    "\u{0050}", //case airdropBox
    "\u{0051}", //case notification
    "\u{0052}", //case sms
    "\u{0053}", //case mail
    "\u{0054}", //case remind
    "\u{0055}", //case settings
    "\u{0056}", //case message
    "\u{0057}", //case group
    "\u{0058}", //case messenger
    "\u{0059}", //case lightMode
    "\u{005A}", //case switchAccount
    "\u{0030}", //case share
    "\u{0031}", //case blockedUsers
    "\u{0032}", //case cellularDataUse
    "\u{0033}", //case browsing
    "\u{0034}", //case region
    "\u{0035}", //case translationForPosts
    "\u{0036}", //case manageAppPermissions
    "\u{0037}", //case download
    "\u{0038}", //case publicPost
    "\u{0039}", //case tag
    "\u{0021}", //case face
    "\u{0022}", //case deleteOne
    "\u{0023}", //case unfollow
    "\u{0024}", //case quoteCast
    "\u{0025}", //case underline
    "\u{0026}", //case italic
    "\u{0027}", //case eraser
    "\u{0028}", //case list
    "\u{0029}", //case addWithCheckmark
    "\u{002A}", //case seeFollowingTopics
    "\u{002B}", //case show
    "\u{002C}", //case edit
    "\u{002D}", //case arowUp
    "\u{002E}", //case notInterested
    "\u{002F}", //case facebook
    "\u{003A}", //case twitter
    "\u{003B}", //case apple
    "\u{003C}", //case email
    "\u{003D}", //case camera
    "\u{003E}", //case cameraLight
    "\u{003F}", //case filter
    "\u{0040}", //case dropDown
    "\u{005B}", //case incorrect
    "\u{005D}", //case arrowObliqueLeft
    "\u{005E}" //case medium
]
