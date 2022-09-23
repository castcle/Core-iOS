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
//  Emum.swift
//  Core
//
//  Created by Castcle Co., Ltd. on 7/4/2565 BE.
//

import UIKit

// MARK: - EnvironmentType
public enum EnvironmentType: String {
    case dev = "DEV"
    case stg = "STG"
    case prod = "PROD"
}

// MARK: - UserRole
public enum UserRole: String {
    case user = "USER"
    case guest = "GUEST"
}

// MARK: - AuthenChannelKey
public enum AuthenChannelKey: String {
    case mobile
    case email
}

// MARK: - AuthenObjective
public enum AuthenObjective: String {
    case forgotPassword = "forgot_password"
    case changePassword = "change_password"
    case verifyMobile = "verify_mobile"
    case mergeAccount = "merge_account"
    case sendToken = "send_token"
    case none
}

// MARK: - SocialType
public enum SocialType: String {
    case facebook
    case twitter
    case google
    case apple = "apple id"
    case unknow

    public var display: String {
        switch self {
        case .facebook:
            return "Facebook"
        case .twitter:
            return "Twitter"
        case .google:
            return "Google"
        case .apple:
            return "Apple"
        default:
            return "Unknow"
        }
    }

    public var icon: UIImage {
        switch self {
        case .facebook:
            return UIImage.init(icon: .castcle(.facebook), size: CGSize(width: 23, height: 23), textColor: UIColor.Asset.white)
        case .twitter:
            return UIImage.init(icon: .castcle(.twitter), size: CGSize(width: 23, height: 23), textColor: UIColor.Asset.white)
        case .google:
            return UIImage.Asset.googleLogo
        case .apple:
            return UIImage.init(icon: .castcle(.apple), size: CGSize(width: 23, height: 23), textColor: UIColor.Asset.white)
        default:
            return UIImage()
        }
    }

    public var color: UIColor {
        switch self {
        case .facebook:
            return UIColor.Asset.facebook
        case .twitter:
            return UIColor.Asset.twitter
        case .google:
            return UIColor.Asset.white
        case .apple:
            return UIColor.Asset.apple
        default:
            return UIColor.clear
        }
    }
}

// MARK: - SocialLinkType
public enum SocialLinkType: String {
    case facebook = "Facebook"
    case twitter = "Twitter"
    case youtube = "Youtube"
    case medium = "Medium"
    case website = "Add website"
}

// MARK: - LinkType
public enum LinkType: String, Codable {
    case twitter
    case youtube
    case rssfeed
    case medium
    case facebook
    case reddit
    case other

    public var image: UIImage {
        switch self {
        case .twitter:
            return UIImage.Asset.twitter
        case .youtube:
            return UIImage.Asset.youtube
        case .rssfeed:
            return UIImage.Asset.rssfeed
        case .medium:
            return UIImage.Asset.medium
        case .facebook:
            return UIImage.Asset.facebook
        case .reddit:
            return UIImage.Asset.reddit
        default:
            return UIImage.Asset.web
        }
    }
}

// MARK: - FarmingHistoryType
public enum FarmingHistoryType {
    case active
    case history
    case unknow
}

// MARK: - HistoryFilterType
public enum HistoryFilterType: String {
    case all
    case day
    case week
    case month

    public var text: String {
        switch self {
        case .all:
            return "All"
        case .day:
            return "Today"
        case .week:
            return "This week"
        case .month:
            return "This month"
        }
    }
}

// MARK: - SettingSection
public enum SettingSection {
    case profile
    case privacy
    case languang
    case aboutUs
    case verify
    case ads
    case farming

    public var text: String {
        switch self {
        case .profile:
            return Localization.CoreSetting.account.text
        case .languang:
            return Localization.CoreSetting.language.text
        case .aboutUs:
            return Localization.CoreSetting.about.text
        case .ads:
            return "Ad Manager"
        case .farming:
            return "Content Farming"
        default:
            return ""
        }
    }

    public var image: UIImage {
        switch self {
        case .profile:
            return UIImage.init(icon: .castcle(.righProfile), size: CGSize(width: 25, height: 25), textColor: UIColor.Asset.white)
        case .privacy:
            return UIImage.init(icon: .castcle(.privacy), size: CGSize(width: 25, height: 25), textColor: UIColor.Asset.white)
        case .languang:
            return UIImage.init(icon: .castcle(.language), size: CGSize(width: 25, height: 25), textColor: UIColor.Asset.white)
        case .aboutUs:
            return UIImage.init(icon: .castcle(.aboutUs), size: CGSize(width: 25, height: 25), textColor: UIColor.Asset.white)
        case .ads:
            return UIImage.init(icon: .castcle(.adsManager), size: CGSize(width: 25, height: 25), textColor: UIColor.Asset.white)
        case .farming:
            return UIImage.init(icon: .castcle(.farm), size: CGSize(width: 25, height: 25), textColor: UIColor.Asset.white)
        default:
            return UIImage()
        }
    }
}

// MARK: - UserFields
public enum UserFields: String {
    case relationships
    case syncSocial = "sync-social"
    case none
}

// MARK: - PostType
public enum PostType: String {
    case newCast = "New Cast"
    case quoteCast = "Quote Cast"
}

// MARK: - ProfileContentType
public enum ProfileContentType: String {
    case all
    case post
    case blog
    case photo
    case unknow
}

// MARK: - FeedCellType
public enum FeedCellType {
    case activity
    case header
    case content
    case quote
    case footer
    case pageAds
    case reach
    case report
    case none
}

// MARK: - ContentType
public enum ContentType: String, Codable {
    case short
    case long
    case blog
    case image
    case shortClip
    case clip
    case live
    case unknow = ""
}

// MARK: - FeedDisplayType
public enum FeedDisplayType: String {
    case postText
    case postLink
    case postLinkPreview
    case postImageX1
    case postImageX2
    case postImageX3
    case postImageXMore
    case blogImage
    case blogNoImage
}

// MARK: - ReportedStatusType
public enum ReportedStatusType: String {
    case illegal
    case appeal
    case removeWithOwner
    case none
}

// MARK: - FeedType
public enum FeedType: String, Codable {
    case content
    case suggestion
    case reminder
    case ads
    case suggestionFollow = "suggestion-follow"
}

// MARK: - ReferencedCastType
public enum ReferencedCastType: String, Codable {
    case quoted
    case recasted
    case unknown
}

// MARK: - AuthorType
public enum AuthorType: String, Codable {
    case people
    case page
    case none
}

// MARK: - ProfileType
public enum ProfileType {
    case mine
    case user
    case unknow
}

// MARK: - FollowType
public enum FollowType {
    case following
    case follower
    case none
}

// MARK: - VerifyCodeType
public enum VerifyCodeType {
    case password
    case mergeAccount
}

// MARK: - UserChannelKey
public enum UserChannelKey: String {
    case email
    case social
}

// MARK: - KeychainKey
public enum KeychainKey: String {
    case castcleDeviceId
    case appleUserId
    case appleEmail
    case appleFullName
}

// MARK: - AdsObjective
public enum AdsObjective: String {
    case engagement
    case reach

    public var detail: String {
        switch self {
        case .engagement:
            return "Get more people to see your Cast or Page"
        case .reach:
            return "Show your ad to the maximum number of people"
        }
    }

    public var image: UIImage {
        switch self {
        case .engagement:
            return UIImage.init(icon: .castcle(.engagement), size: CGSize(width: 100, height: 100), textColor: UIColor.Asset.white)
        case .reach:
            return UIImage.init(icon: .castcle(.reach), size: CGSize(width: 100, height: 100), textColor: UIColor.Asset.white)
        }
    }
}

// MARK: - AdStatus
public enum AdStatus: String {
    case processing
    case declinded
    case approved
    case canceled

    public var display: String {
        switch self {
        case .processing:
            return "In process"
        case .declinded:
            return "Declined"
        case .approved:
            return "Approved"
        case .canceled:
            return "Canceled"
        }
    }
}

// MARK: - BoostStatus
public enum BoostStatus: String {
    case unknown
    case running
    case pause
    case end

    public var display: String {
        switch self {
        case .unknown:
            return "N/A"
        case .running:
            return "Running"
        case .pause:
            return "Pause"
        case .end:
            return "End"
        }
    }
}

// MARK: - BoostType
public enum BoostType: String {
    case user
    case content
}

// MARK: - AdsPaymentType
public enum AdsPaymentType: String {
    case token = "token-wallet"
    case adCredit = "ad-credit"

    public var display: String {
        switch self {
        case .token:
            return "Token wallet"
        case .adCredit:
            return "Ad credit"
        }
    }

    public var image: UIImage {
        switch self {
        case .token:
            return UIImage.init(icon: .castcle(.wallet), size: CGSize(width: 100, height: 100), textColor: UIColor.Asset.white)
        case .adCredit:
            return UIImage.init(icon: .castcle(.coin), size: CGSize(width: 100, height: 100), textColor: UIColor.Asset.white)
        }
    }

    public var notice: String {
        switch self {
        case .token:
            return "Approximate token value in\nUSD 40.32 Learn more"
        case .adCredit:
            return "Note: Ad credit are valid\nuntil 29/12/2020"
        }
    }
}

// MARK: - DailyBidType
public enum DailyBidType: String {
    case auto
    case costPerAccount = "cost-per-account"

    public var display: String {
        switch self {
        case .auto:
            return "Auto bid (Recommended)"
        case .costPerAccount:
            return "Cost per account"
        }
    }

    public var image: UIImage {
        switch self {
        case .auto:
            return UIImage.init(icon: .castcle(.autoBid), size: CGSize(width: 100, height: 100), textColor: UIColor.Asset.white)
        case .costPerAccount:
            return UIImage.init(icon: .castcle(.costPerAccount), size: CGSize(width: 100, height: 100), textColor: UIColor.Asset.white)
        }
    }

    public var notice: String {
        switch self {
        case .auto:
            return "Maximize your budget to get the best result"
        case .costPerAccount:
            return "Set daily cost per account to manage cost per 1k impressions"
        }
    }
}

// MARK: - SearchSection
public enum SearchSection {
    case trend
    case lastest
    case photo
    case people
    case none
}

// MARK: - NotificationSection
public enum NotificationSection: String {
    case profile
    case page
    case system
}

// MARK: - NotificationType
public enum NotificationType: String {
    case comment
    case follow
    case like
    case recast
    case adsApprove = "ads-approve"
    case illegalDone = "illegal-done"
    case none
}

// MARK: - UpdateImageType
public enum UpdateImageType {
    case avatar
    case cover
    case none
}

// MARK: - SearchResualState
public enum SearchResualState {
    case initial
    case suggest
    case hastag
    case resualt
    case unknow
}

// MARK: - WalletHistoryType
public enum WalletHistoryType: String {
    case walletBalance = "wallet-balance"
    case contentFarming = "content-farming"
    case socialRewards = "social-rewards"
    case depositSend = "deposit-send"
    case airdropReferral = "airdrop-referral"

    public var display: String {
        switch self {
        case .walletBalance:
            return "Wallet Balance"
        case .contentFarming:
            return "Content Farming"
        case .socialRewards:
            return "Social Rewards"
        case .depositSend:
            return "Deposit & Send"
        case .airdropReferral:
            return "Referral & Airdrop"
        }
    }
}

// MARK: - ReactionType
public enum ReactionType: String {
    case like
    case recast
    case none
}

// MARK: - ReactionType
public enum QrCodeType: String {
    case wallet
    case deposit

    public var display: String {
        switch self {
        case .wallet:
            return "My QR Code"
        case .deposit:
            return "Deposit CAST"
        }
    }
}

// MARK: - SizeType
public enum SizeType: String {
    case thumbnail
    case medium
    case large
}

// MARK: - FarmingStatus
public enum FarmingStatus: String {
    case available
    case farming
    case farmed
    case limit
}

// MARK: - LandingPage
public enum LandingPage: String {
    case follower
    case comment
    case cast
    case none
}

// MARK: - TrackingEventType
public enum TrackingEventType: String {
    case login = "Login"
    case registration = "Registration"
    case verificationMobile = "Verification Mobile"
    case viewFeed = "View Feed"
    case viewSetting = "View Setting"
    case viewAccount = "View Account"
    case resetPassword = "Reset Password"
    case viewResetPassword = "View Reset Password"
    case viewSyncSocial = "View Sync Social"
    case connectSyncSocial = "Connect Sync Social"
    case disconnectSyncSocial = " Disconnect Sync Social"
    case autoPostSyncSocial = "Auto Post Sync Social"
    case viewDeleteAccount = "View Delete Account"
    case deleteAccount = "Delete Account"
    case viewWallet = "View Wallet"

    public var firebaseEvent: String {
        switch self {
        case .login:
            return "login"
        case .registration:
            return "registration"
        case .verificationMobile:
            return "verification_mobile"
        case .viewFeed:
            return "view_feed"
        case .viewSetting:
            return "view_setting"
        case .viewAccount:
            return "view_account"
        case .resetPassword:
            return "reset_password"
        case .viewResetPassword:
            return "view_reset_password"
        case .viewSyncSocial:
            return "view_sync_social"
        case .connectSyncSocial:
            return "connect_sync_social"
        case .disconnectSyncSocial:
            return "disconnect_sync_social"
        case .autoPostSyncSocial:
            return "auto_post_sync_social"
        case .viewDeleteAccount:
            return "view_delete_account"
        case .deleteAccount:
            return "delete_account"
        case .viewWallet:
            return "view_wallet"
        }
    }

    public var adjustEventToken: String {
        switch self {
        case .login:
            return AdjustEventToken.login
        case .registration:
            return AdjustEventToken.registration
        case .verificationMobile:
            return AdjustEventToken.verificationMobile
        case .viewFeed:
            return AdjustEventToken.viewFeed
        case .viewSetting:
            return AdjustEventToken.viewSetting
        case .viewAccount:
            return AdjustEventToken.viewAccount
        case .resetPassword:
            return AdjustEventToken.resetPassword
        case .viewResetPassword:
            return AdjustEventToken.viewResetPassword
        case .viewSyncSocial:
            return AdjustEventToken.viewSyncSocial
        case .connectSyncSocial:
            return AdjustEventToken.connectSyncSocial
        case .disconnectSyncSocial:
            return AdjustEventToken.disconnectSyncSocial
        case .autoPostSyncSocial:
            return AdjustEventToken.autoPostSyncSocial
        case .viewDeleteAccount:
            return AdjustEventToken.viewDeleteAccount
        case .deleteAccount:
            return AdjustEventToken.deleteAccount
        case .viewWallet:
            return  AdjustEventToken.viewWallet
        }
    }
}

// MARK: - TrackingChennel
public enum TrackingChennel: String {
    case email
    case facebook = "social_facebook"
    case twitter = "social_twitter"
    case google = "social_google"
    case apple = "social_apple"
    case unkown
}

// MARK: - WalletTransactionType
public enum WalletTransactionType: String {
    case deposit
    case send
    case receive
    case withdraw
    case social
    case referral
    case airdrop
    case farming
    case unfarming
    case farmed
    case unkown

    public var display: String {
        switch self {
        case .deposit:
            return "Deposit"
        case .send:
            return "Send"
        case .receive:
            return "Receive"
        case .withdraw:
            return "Withdraw"
        case .social:
            return "Social Reward"
        case .referral:
            return "Referral Reward"
        case .airdrop:
            return "Airdrop Reward"
        case .farming:
            return "Farming"
        case .unfarming:
            return "Undo Farming"
        case .farmed:
            return "Farming reward"
        case .unkown:
            return ""
        }
    }
}

// MARK: - WalletTransactionStatusType
public enum WalletTransactionStatusType: String {
    case success
    case pending
    case failed
    case verified
    case unkown

    public var display: String {
        switch self {
        case .success:
            return "Success"
        case .pending:
            return "Pending"
        case .failed:
            return "Failed"
        case .verified:
            return "Success"
        case .unkown:
            return ""
        }
    }
}

// MARK: - ReportType
public enum ReportType: String {
    case content
    case user
}

// MARK: - LoadState
public enum LoadState {
    case loading
    case loaded
}

// MARK: - State
public enum State {
    case getMe
    case getMyPage
    case getUserInfo
    case unregisterToken
    case registerToken
    case connectSocial
    case requestOtpWithMobile
    case requestOtpWithEmail
    case verifyOtpWithMobile
    case verifyOtpWithEmail
    case updateMobile
    case getMention
    case getHastag
    case suggestCastcleId
    case checkCastcleIdExists
    case register
    case createPage
    case createPageWithSocial
    case deletePage
    case updateUserInfo
    case updateUserAvatar
    case updateUserCover
    case updatePassword
    case followUser
    case unfollowUser
    case reportUser
    case blockUser
    case unblockUser
    case setAutoPost
    case cancelAutoPost
    case reconnectSyncSocial
    case disconnectSyncSocial
    case syncSocial
    case guestLogin
    case login
    case refreshToken
    case getContent
    case getContentDetail
    case getComments
    case getCommentDetail
    case createComment
    case replyComment
    case likeComment
    case unlikeComment
    case deleteComment
    case deleteReplyComment
    case deleteContent
    case reportContent
    case getCountryCode
    case getBadges
    case getNotification
    case deleteNotification
    case readNotification
    case readAllNotification
    case getUserLikeContent
    case getUserRecastContent
    case getWalletShortcuts
    case sortWalletShortcuts
    case createWalletShortcut
    case updateWalletShortcut
    case deleteWalletShortcut
    case getWalletRecent
    case walletSearch
    case reviewSendToken
    case confirmSendToken
    case walletLookup
    case getWalletHistory
    case notAppealCast
    case appealCast
    case farmingLookup
    case farmingCast
    case unfarmingCast
    case getFarmingActive
    case getFarmingHistory
    case getAds
    case getAdsDetail
    case createAdsUser
    case cancelAds
    case none
}
