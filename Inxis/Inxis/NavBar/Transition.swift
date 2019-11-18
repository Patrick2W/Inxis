//
//  Transition.swift
//  Inxis
//
//  Created by cheyun on 2019/11/18.
//  Copyright © 2019 ixxxxx.com. All rights reserved.
//

import UIKit

public class Transition: NSObject {
    private let kFrame = "frame"
    private let kFakeTag: Int = 23332
    
    private func showFakeBar(fakeBar: FakeBar, onCtl: UIViewController) {
        onCtl.view.addObserver(self, forKeyPath: kFrame, options: .new, context: nil)
        fakeBar.barConfig = onCtl.barConfig
        fakeBar.tag = kFakeTag
        onCtl.view.addSubview(fakeBar)
        updateFakeBarFrame(fakeBar: fakeBar, view: onCtl.view)
    }
    
    private func removeFakeBar(fakeBar: FakeBar, onCtl: UIViewController) {
        onCtl.view.removeObserver(self, forKeyPath: kFrame)
        fakeBar.removeFromSuperview()
    }
    
    private func updateFakeBarFrame(fakeBar: FakeBar, view: UIView) {
        guard let ctl = view.next as? UIViewController else { return }
        guard let navCtl = ctl.navigationController else { return }
        let bar = navCtl.navigationBar
        let rect = bar.superview!.convert(bar.frame, to: ctl.view)
        let frame = CGRect(x: 0, y: 0, width: rect.width + rect.minX, height: rect.height + rect.minY)
        fakeBar.frame = frame
    }
    
    override public func observeValue(forKeyPath keyPath: String?,
                                      of object: Any?,
                                      change: [NSKeyValueChangeKey : Any]?,
                                      context: UnsafeMutableRawPointer?) {
        if keyPath == kFrame {
            guard let current = object as? UIView else { return }
            if let fakeBar = current.viewWithTag(kFakeTag) as? FakeBar {
                updateFakeBarFrame(fakeBar: fakeBar, view: current)
            }
        } else {
            super.observeValue(forKeyPath: keyPath,
                               of: object,
                               change: change,
                               context: context)
        }
    }
}


extension Transition: UINavigationControllerDelegate {
    
    public func navigationController(_ navigationController: UINavigationController,
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
            let showFake = fromCtl.barConfig != toCtl.barConfig
            var fromFakeBar: FakeBar?, toFakeBar: FakeBar?
            if showFake {
                // need fake bar
                fromFakeBar = FakeBar()
                toFakeBar = FakeBar()
                showFakeBar(fakeBar: fromFakeBar!, onCtl: fromCtl)
                showFakeBar(fakeBar: toFakeBar!, onCtl: toCtl)
                
                bar.barConfig = BarConfig(image: UIImage(),
                                          shadowImage: UIImage(),
                                          style: toCtl.barConfig.style)
            }
            
            transition.animate(alongsideTransition: { context in
                bar.updateTitleTextAttributes(color: toCtl.barConfig.titleColor,
                                              font: toCtl.barConfig.titleFont)
            }) { context in
                if showFake {
                    // remove fake bar
                    self.removeFakeBar(fakeBar: fromFakeBar!, onCtl: fromCtl)
                    self.removeFakeBar(fakeBar: toFakeBar!, onCtl: toCtl)
                }
                if context.isCancelled {
                    // animation cancelled
                    bar.barConfig = fromCtl.barConfig
                } else {
                    // animation finished
                    bar.barConfig = toCtl.barConfig
                }
            }
            
        } else {
            // no animation
            bar.barConfig = toCtl.barConfig
        }
    }
}
