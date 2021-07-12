//
//  Utility.swift
//  Core
//
//  Created by Tanakorn Phoochaliaw on 12/7/2564 BE.
//

import UIKit

public class Utility {
    public static func currentViewController() -> UIViewController {
        let getWindow : UIWindow? = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        let topController = getWindow?.visibleViewController()
        return topController ?? UIViewController()
    }
}
