//
//  NavigationController.swift
//  Example
//
//  Created by Patrick W on 2019/11/19.
//  Copyright © 2019 ixxxxx.com. All rights reserved.
//

import UIKit
import Inxis

class NavigationController: UINavigationController {
    
    lazy var transition = Transition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = transition
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.extendedLayoutIncludesOpaqueBars = true
        super.pushViewController(viewController, animated: animated)
    }
}
