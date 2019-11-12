//
//  UIColor+inx.swift
//  Inxis
//
//  Created by cheyun on 2019/11/12.
//  Copyright © 2019 ixxxxx.com. All rights reserved.
//

import UIKit

public extension Assistant where Target: UIColor {
    
    static var random: UIColor {
        get {
            return RGB(Int(arc4random() % 255),
                       green: Int(arc4random() % 255),
                       blue: Int(arc4random() % 255))
        }
    }
    
    static func RGB(_ red: Int, green: Int, blue: Int) -> UIColor {
        return RGBA(red, green: green, blue: blue, alpha: 1.0)
    }
    
    static func RGBA(_ red: Int, green: Int, blue: Int, alpha: Float) -> UIColor {
        return UIColor(red: CGFloat(red) / 255.0,
                       green: CGFloat(green) / 255.0,
                       blue: CGFloat(blue) / 255.0,
                       alpha: CGFloat(alpha))
    }
    
    static func hex(_ hex: UInt32) -> UIColor {
        let r = (hex & 0xFF0000) >> 16
        let g = (hex & 0xFF00) >> 8
        let b = (hex & 0xFF)
        return RGB(Int(r), green: Int(g), blue: Int(b))
    }
    
    static func hexa(_ hexa: UInt32) -> UIColor {
        let r = (hexa & 0xFF000000) >> 24
        let g = (hexa & 0xFF0000) >> 16
        let b = (hexa & 0xFF00) >> 8
        let a = Float(hexa & 0xFF) / 255.0
        return RGBA(Int(r), green: Int(g), blue: Int(b), alpha: a)
    }
    
    static func gradient(_ colors: [UIColor], size: CGSize) -> UIColor? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let context = UIGraphicsGetCurrentContext()
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        guard let gradientRef = CGGradient(colorsSpace: colorSpace,
                                           colors: (colors.map { $0.cgColor } as CFArray),
                                           locations: nil) else {
            return nil
        }
        context?.drawLinearGradient(gradientRef,
                                    start: CGPoint(x: 0, y: 0),
                                    end: CGPoint(x: size.width, y: size.height),
                                    options: CGGradientDrawingOptions(rawValue: 0))
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            return nil
        }
        context?.restoreGState()
        UIGraphicsEndImageContext()
        return UIColor(patternImage: image)
    }
}
