//
//  UIViewController+NavBar.swift
//  Inxis
//
//  Created by cheyun on 2019/11/18.
//  Copyright © 2019 ixxxxx.com. All rights reserved.
//

import UIKit

extension UIViewController {
    
    public static var kNavBar = "_kNavBar"
    
    public var barConfig: BarConfig {
        set {
            let policy: objc_AssociationPolicy = .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            objc_setAssociatedObject(self, &UIViewController.kNavBar, newValue, policy)
        }
        get {
            if let config = objc_getAssociatedObject(self, &UIViewController.kNavBar) as? BarConfig {
                return config
            }
            return BarConfig.appearance
        }
    }
    
    public func updateNavBarIfNeeds() {
        if let bar = self.navigationController?.navigationBar as? NavBar {
            bar.barConfig = self.barConfig
        }
    }
}
