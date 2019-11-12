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
    
    func push(to viewController: UIViewController, duration: TimeInterval = 0.35, transition: UIView.AnimationTransition) {
        guard let pushController = target.navigationController else {
            return
        }
        UIView.beginAnimations(nil, context: nil)
        push(to: viewController, animated: false)
        UIView.setAnimationDuration(duration)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationTransition(transition, for: pushController.view, cache: true)
        UIView.commitAnimations()
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
    
    func pop(_ toViewController: UIViewController? = nil, duration: TimeInterval = 0.35, transtion: UIView.AnimationTransition) -> [UIViewController]? {
        guard let popController = target.navigationController else {
            return nil
        }
        UIView.beginAnimations(nil, context: nil)
        let vcs = pop(toViewController, animated: false)
        UIView.setAnimationDuration(duration)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationTransition(transtion, for: popController.view, cache: true)
        UIView.commitAnimations()
        return vcs
    }
}
