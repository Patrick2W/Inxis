//
//  UIImage+inx.swift
//  Inxis
//
//  Created by cheyun on 2019/11/13.
//  Copyright © 2019 ixxxxx.com. All rights reserved.
//

import UIKit

public extension Assistant where Target: UIImage {
    
    static func image(_ color: UIColor, size: CGSize = CGSize(width: 1.0, height: 1.0)) -> UIImage? {
        let rect = CGRect(origin: CGPoint.zero, size: size)
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        context?.restoreGState()
        UIGraphicsEndImageContext()
        return image
    }
    
    static func gradient(_ colors: [UIColor], size: CGSize) -> UIImage? {
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
        let image = UIGraphicsGetImageFromCurrentImageContext()
        context?.restoreGState()
        UIGraphicsEndImageContext()
        return image
    }
}
