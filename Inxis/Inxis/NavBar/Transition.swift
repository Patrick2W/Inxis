//
//  Transition.swift
//  Inxis
//
//  Created by cheyun on 2019/11/18.
//  Copyright © 2019 ixxxxx.com. All rights reserved.
//

import UIKit

class Transition: NSObject {
    
    private var fromFakeBar: FakeBar?
    private var toFakeBar: FakeBar?
    
}


extension Transition: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              willShow viewController: UIViewController,
                              animated: Bool) {
        // navigationBar not kind of class NavBar, return
        guard let bar = navigationController.navigationBar as? NavBar else { return }
        // toViewController
        let toCtl = viewController
        // navigationBar hidden
        navigationController.setNavigationBarHidden(toCtl.barConfig.hidden, animated: animated)
        if let transition = navigationController.transitionCoordinator {
            // fromViewController
            guard let fromCtl = transition.viewController(forKey: .from) else {
                return
            }
            if fromCtl.barConfig == toCtl.barConfig {
                // need fake bar
            }
            
            transition.animate(alongsideTransition: { context in
                
            }) { context in
                if context.isCancelled {
                    // animation cancelled
                } else {
                    // animation finished
                }
            }
            
        } else {
            // no animation
            bar.barConfig = BarConfig()
        }
    }
}
