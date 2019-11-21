//
//  UIView+inx.swift
//  Inxis
//
//  Created by cheyun on 2019/11/4.
//  Copyright © 2019 ixxxxx.com. All rights reserved.
//

import UIKit

public extension Assistant where Target: UIView {
    
    var minX: CGFloat { return target.frame.origin.x }
    var minY: CGFloat { return target.frame.origin.y }
    var centerX: CGFloat { return target.center.x }
    var centerY: CGFloat { return target.center.y }
    var maxX: CGFloat { return target.inx.minX + target.inx.height }
    var maxY: CGFloat { return target.inx.minY + target.inx.width }
    var height: CGFloat { return target.frame.height }
    var width: CGFloat { return target.frame.width }
    var origin: CGPoint { return target.frame.origin }
    var size: CGSize { return target.frame.size }
    var cornerRadius: CGFloat { return target.layer.cornerRadius }
    
    func setMinX(_ value: CGFloat) {
        var frame = target.frame
        frame.origin.x = value
        target.frame = frame
    }
    
    func setMinY(_ value: CGFloat) {
        var frame = target.frame
        frame.origin.y = value
        target.frame = frame
    }
    
    func setCenterX(_ value: CGFloat) {
        var center = target.center
        center.x = value
        target.center = center
    }
    
    func setCenterY(_ value: CGFloat) {
        var center = target.center
        center.y = value
        target.center = center
    }
    
    func setMaxX(_ value: CGFloat) {
        var frame = target.frame
        frame.origin.x = value - target.inx.height
        target.frame = frame
    }
    
    func setMaxY(_ value: CGFloat) {
        var frame = target.frame
        frame.origin.y = value - target.inx.width
        target.frame = frame
    }
    
    func setHeight(_ value: CGFloat) {
        var frame = target.frame
        frame.size.height = value
        target.frame = frame
    }
    
    func setWidth(_ value: CGFloat) {
        var frame = target.frame
        frame.size.width = value
        target.frame = frame
    }
    
    func setOrigin(_ origin: CGPoint) {
        var frame = target.frame
        frame.origin = origin
        target.frame = frame
    }
    
    func setSize(_ size: CGSize) {
        var frame = target.frame
        frame.size = size
        target.frame = frame
    }
    
    func removeAllSubviews() {
        while target.subviews.count > 0 {
            target.subviews.last?.removeFromSuperview()
        }
    }
    
    func setCorner(radius: CGFloat, rectCorner: UIRectCorner = .allCorners) {
        if #available(iOS 11.0, *) {
            target.layer.cornerRadius = radius
            target.layer.maskedCorners = CACornerMask(rawValue: rectCorner.rawValue)
        } else {
            let path = UIBezierPath(roundedRect: target.bounds,
                                    byRoundingCorners: rectCorner,
                                    cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.frame = target.bounds
            mask.path = path.cgPath
            target.layer.mask = mask
        }
    }
}
