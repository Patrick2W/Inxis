//
//  NavBar.swift
//  Inxis
//
//  Created by cheyun on 2019/11/18.
//  Copyright © 2019 ixxxxx.com. All rights reserved.
//

import UIKit

public class NavBar: UINavigationBar {
    
    var barConfig: BarConfig? {
        didSet {
            updateNavBar()
        }
    }
    
    private var barBgView: UIView? {
        get { return self.value(forKey: "_backgroundView") as? UIView }
    }
    
    private func updateBackgroundAlpha(alpha: Float) {
        
        guard let background = barBgView else { return }
        if !Float(background.alpha).isSame(as: alpha) {
            background.alpha = CGFloat(alpha)
        }
    }
    
    private func updateShowdowImage(image: UIImage?) {
        
        if let current = self.shadowImage {
            if !current.isSame(as: image) {
                shadowImage = image
            }
        } else if image != nil {
            shadowImage = image
        }
    }
    
    private func updateBackgroundImage(image: UIImage?) {
        if let current = self.backgroundImage(for: .default) {
            if !current.isSame(as: image) {
                setBackgroundImage(image, for: .default)
            }
        } else if image != nil {
            setBackgroundImage(image, for: .default)
        }
    }
    
    public func updateTitleTextAttributes(color: UIColor?, font: UIFont?) {
        var attributes = [NSAttributedString.Key : Any]()
        if let textColor = color {
            attributes[.foregroundColor] = textColor
        }
        if let textFont = font {
            attributes[.font] = textFont
        }
        titleTextAttributes = attributes
    }
    
    private func updateNavBar() {
        
        guard let config = barConfig else { return }
        
        if !config.translucent {
            isTranslucent = config.alpha < 1.0
        } else {
            isTranslucent = true
        }
        barTintColor = config.tintColor
        barStyle = config.style
        
        updateBackgroundAlpha(alpha: config.alpha)
        updateShowdowImage(image: config.shadowImage)
        updateBackgroundImage(image: config.image)
        updateTitleTextAttributes(color: config.titleColor, font: config.titleFont)
    }
}
