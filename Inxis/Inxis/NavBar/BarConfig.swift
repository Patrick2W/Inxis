//
//  BarConfig.swift
//  Inxis
//
//  Created by cheyun on 2019/11/18.
//  Copyright © 2019 ixxxxx.com. All rights reserved.
//

import UIKit

public struct BarConfig {
    public static var appearance = BarConfig()
    
    /// bar item title color
    public var titleColor: UIColor?
    
    /// bar item title font
    public var titleFont: UIFont?
    
    /// bar background image
    public var image: UIImage?
    
    /// bar shadow image
    public var shadowImage: UIImage?
    
    /// bar translucent
    public var translucent: Bool = true
    
    /// bar hidden, defalut false
    public var hidden: Bool = false
    
    /// bar alpha
    public var alpha: Float = 1.0
    
    /// bar style
    public var style: UIBarStyle = .default
    
    /// bar tint color, default nil
    public var tintColor: UIColor?
    
    init(titleColor: UIColor? = nil,
         titleFont: UIFont? = nil,
         image: UIImage? = nil,
         shadowImage: UIImage? = nil,
         translucent: Bool = true,
         hidden: Bool = false,
         alpha: Float = 1.0,
         style: UIBarStyle = .default,
         tintColor: UIColor? = nil) {
        self.titleColor = titleColor
        self.titleFont = titleFont
        self.image = image
        self.shadowImage = shadowImage
        self.translucent = translucent
        self.hidden = hidden
        self.alpha = alpha
        self.style = style
        self.tintColor = tintColor
    }
}

extension BarConfig: Equatable {
    
    public static func == (lhs: BarConfig, rhs: BarConfig) -> Bool {
        if lhs.hidden == rhs.hidden {
            return true
        }
        if lhs.translucent != rhs.translucent {
            return false
        }
        if !lhs.alpha.isSame(as: rhs.alpha) {
            return false
        }
        if let image = lhs.image {
            if !image.isSame(as: rhs.image) {
                return false
            }
        } else {
            if rhs.image != nil {
                return false
            } else if lhs.tintColor != rhs.tintColor {
                return false
            }
        }
        return true
    }
    
    public static func != (lhs: BarConfig, rhs: BarConfig) -> Bool {
        
        return !(lhs == rhs)
    }
}
