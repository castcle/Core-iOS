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
//  EnumNetworking.swift
//  Core
//
//  Created by Castcle Co., Ltd. on 8/4/2565 BE.
//

public enum JsonKey: String {
    case id
    case payload
    case includes
    case provider
    case socialId
    case userName
    case displayName
    case overview
    case avatar
    case cover
    case link
    case authToken
    case email
    case phone
    case password
    case message
    case like
    case author
    case reply
    case metrics
    case participate
    case createdAt
    case updatedAt
    case comments
    case users
    case casts
    case pdpa
    case userFields
    case keyword
    case type
    case hashtag
    case maxResults
    case untilId
    case castcleId
    case referral
    case images
    case contact
    case following
    case followers
    case links
    case followed
    case blocking
    case blocked
    case verified
    case syncSocial
    case count
    case facebook
    case twitter
    case youtube
    case medium
    case google
    case apple
    case website
    case active
    case autoPost
    case dob
    case aggregator
    case passwordNotSet
    case linkSocial
    case mobile
    case canUpdateCastcleId
    case original
    case thumbnail
    case fullHd
    case large
    case countryCode
    case number
    case contentId
    case feedItemId
    case photo
    case contents
    case image
    case meta
    case role
    case official
    case showAds
    case pages
    case code
    case slug
    case name
    case userNameLower = "username"
    case about
    case key
    case rank
    case trends
    case text
    case isTrending
    case campaignName
    case campaignMessage
    case campaignCode
    case objective
    case dailyBudget
    case duration
    case dailyBidType
    case dailyBidValue
    case adStatus
    case boostStatus
    case boostType
    case statistics
    case engagement
    case budgetSpent
    case impression
    case reach
    case cpm = "CPM"
    case organic
    case paid
    case likes
    case recast
    case quotecast
    case clicks
    case followerGain
    case farm
    case saved
    case rewardDistributed
    case ios
    case android
    case url
    case version
    case button
    case buttonOk = "button_ok"
    case buttonCancel = "button_cancel"
    case title
    case eng = "en"
    case tha = "th"
    case hashtags
    case topics
    case follows
    case display
    case description
    case imagePreview
    case authorId
    case referencedCasts
    case feature
    case circle
    case header
    case social
    case likeCount
    case commentId
    case commentCount
    case quoteCount
    case recastCount
    case farmCount
    case liked
    case commented
    case quoted
    case recasted
    case reported
    case farming
    case oldestId
    case newestId
    case resultCount
    case channel
    case targetCastcleId
    case targetContentId
    case refCode
    case mobileNumber
    case page
    case profile
    case system
    case uuid
    case firebaseToken
    case platform
    case source
    case read
    case landingPage
    case profileId
    case otp
    case newPassword
    case limit
    case contentType
    case deviceUuid = "deviceUUID"
    case accessToken
    case fbAccessToken = "access_token"
    case refreshToken
    case exist
    case suggestCastcleId
    case registered
    case client
    case accountId
    case uxSessionId
    case screenId
    case screenInstance
    case target
    case targetId
    case eventType
    case eventData
    case timestamp
    case paymentMethod
    case userId
    case dialCode
    case flag
    case size
    case date
    case chainId
    case order
    case accounts
    case shortcuts
    case walletAddress
    case memo
    case castcle
    case other
    case transaction
    case address
    case amount
    case note
    case availableBalance
    case adsCredit
    case farmBalance
    case totalBalance
}
