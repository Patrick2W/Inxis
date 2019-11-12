//
//  UIWindow+inx.swift
//  Inxis
//
//  Created by cheyun on 2019/11/12.
//  Copyright © 2019 ixxxxx.com. All rights reserved.
//

import UIKit


public extension Assistant where Target: UIWindow {
    
    func setRoot(_ viewController: UIViewController, duration: TimeInterval = 0.35, options: UIView.AnimationOptions) {
        if duration > 0 {
            UIView.transition(with: target,
                              duration: duration,
                              options: options,
                              animations: {
                                let tempState = UIView.areAnimationsEnabled
                                UIView.setAnimationsEnabled(false)
                                self.target.rootViewController = viewController
                                UIView.setAnimationsEnabled(tempState)
            })
        } else {
            target.rootViewController = viewController
        }
    }
    
    
}
