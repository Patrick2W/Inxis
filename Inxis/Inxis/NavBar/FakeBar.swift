//
//  FakeBar.swift
//  Inxis
//
//  Created by cheyun on 2019/11/18.
//  Copyright © 2019 ixxxxx.com. All rights reserved.
//

import UIKit

class FakeBar: UIToolbar {
    
    var barConfig: BarConfig? {
        didSet {
            updateFakeBar()
        }
    }
    
    private var barBgView: UIView? {
        get { return self.value(forKey: "_backgroundView") as? UIView }
    }
    
    private func updateFakeBar() {
        guard let config = self.barConfig else {
            return
        }
        updateBarBgAlpha(alpha: config.alpha)
        updateBackgroundImage(image: config.image)
        self.barTintColor = config.tintColor
        self.isTranslucent = config.alpha < 1.0
        self.barStyle = config.style
    }
    
    private func updateBarBgAlpha(alpha: Float) {
        guard let bgView = barBgView else { return }
        if !Float(bgView.alpha).isSame(as: alpha) {
            bgView.alpha = CGFloat(alpha)
        }
    }
    
    private func updateBackgroundImage(image: UIImage?) {
        if let current = backgroundImage(forToolbarPosition: .any, barMetrics: .default) {
            if !current.isSame(as: image) {
                setBackgroundImage(image, forToolbarPosition: .any, barMetrics: .default)
            }
        } else {
            setBackgroundImage(image, forToolbarPosition: .any, barMetrics: .default)
        }
    }
}
