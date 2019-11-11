//
//  UIViewController+inx.swift
//  Inxis
//
//  Created by cheyun on 2019/11/11.
//  Copyright © 2019 ixxxxx.com. All rights reserved.
//

import UIKit

public extension Assistant where Target: UIViewController {
    
    static func load(_ sbName: String, idfer: String, bundle: Bundle? = Bundle.main) -> Target {
        let storybord = UIStoryboard(name: sbName, bundle: bundle)
        let viewController = storybord.instantiateViewController(withIdentifier: idfer) as! Target
        return viewController
    }
    
    func push(to viewController: UIViewController, animated: Bool = true) {
        target.navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func pop(_ toViewController: UIViewController? = nil, animated: Bool = true) -> [UIViewController]? {
        if let toVC = toViewController {
            return target.navigationController?.popToViewController(toVC, animated: animated)
        }
        if let popVC = target.navigationController?.popViewController(animated: animated) {
            return [popVC]
        }
        return nil
    }
}
