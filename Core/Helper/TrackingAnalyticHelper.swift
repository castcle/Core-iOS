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
//  TrackingAnalyticHelper.swift
//  Core
//
//  Created by Castcle Co., Ltd. on 23/6/2565 BE.
//

import Adjust
import FirebaseAnalytics

public class TrackingAnalyticHelper {
    public static let shared = TrackingAnalyticHelper()

    private func getEventToken(eventType: TrackingEventType) -> String {
        if eventType == .registration {
            return AdjustEventToken.registration
        } else if eventType == .login {
            return AdjustEventToken.login
        } else if eventType == .verificationMobile {
            return AdjustEventToken.verificationMobile
        } else if eventType == .viewFeed {
            return AdjustEventToken.viewFeed
        } else if eventType == .viewSetting {
            return AdjustEventToken.viewSetting
        } else if eventType == .viewAccount {
            return AdjustEventToken.viewAccount
        } else if eventType == .resetPassword {
            return AdjustEventToken.resetPassword
        } else if eventType == .viewResetPassword {
            return AdjustEventToken.viewResetPassword
        } else if eventType == .viewSyncSocial {
            return AdjustEventToken.viewSyncSocial
        } else if eventType == .connectSyncSocial {
            return AdjustEventToken.connectSyncSocial
        } else if eventType == .disconnectSyncSocial {
            return AdjustEventToken.disconnectSyncSocial
        } else if eventType == .autoPostSyncSocial {
            return AdjustEventToken.autoPostSyncSocial
        } else if eventType == .viewDeleteAccount {
            return AdjustEventToken.viewDeleteAccount
        } else if eventType == .deleteAccount {
            return AdjustEventToken.deleteAccount
        } else if eventType == .viewWallet {
            return AdjustEventToken.viewWallet
        } else {
            return ""
        }
    }

    public func sendTrackingAnalytic(eventType: TrackingEventType, item: Analytic) {
        self.sendAdjustAnalytic(eventType: eventType, item: item)
        self.sendFirebaseAnalytic(eventType: eventType, item: item)
    }

    private func sendAdjustAnalytic(eventType: TrackingEventType, item: Analytic) {
        let event = ADJEvent(eventToken: self.getEventToken(eventType: eventType))
        if !item.accountId.isEmpty {
            event?.addCallbackParameter("account_id", value: item.accountId)
        }
        if !item.userId.isEmpty {
            event?.addCallbackParameter("user_id", value: item.userId)
        }
        if !item.channel.isEmpty {
            event?.addCallbackParameter("channel", value: item.channel)
        }
        if !item.countryCode.isEmpty {
            event?.addCallbackParameter("country_code", value: item.countryCode)
        }
        if !item.role.isEmpty {
            event?.addCallbackParameter("role", value: item.role)
        }
        if !item.active.isEmpty {
            event?.addCallbackParameter("active", value: item.active)
        }
        Adjust.trackEvent(event)
    }

    private func sendFirebaseAnalytic(eventType: TrackingEventType, item: Analytic) {
        Analytics.logEvent(eventType.firebaseEvent, parameters: item.toDict())
    }
}
