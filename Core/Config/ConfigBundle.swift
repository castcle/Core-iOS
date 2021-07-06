//
//  ConfigBundle.swift
//  Core
//
//  Created by Tanakorn Phoochaliaw on 2/7/2564 BE.
//

public struct ConfigBundle {
    public static var mainApp: Bundle = .main
    public static var core: Bundle = Bundle(identifier: "com.castcle.Core")!
    public static var component: Bundle = Bundle(identifier: "com.castcle.Component")!
    public static var feed: Bundle = Bundle(identifier: "com.castcle.Feed")!
    public static var search: Bundle = Bundle(identifier: "com.castcle.Search")!
}
