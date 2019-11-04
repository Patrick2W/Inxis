//
//  UIView+inx.swift
//  Inxis
//
//  Created by cheyun on 2019/11/4.
//  Copyright © 2019 ixxxxx.com. All rights reserved.
//

import UIKit

public extension Assistant where Target: UIView {
    
    var minX: CGFloat {
        set {
            var frame = target.frame
            frame.origin.x = newValue
            target.frame = frame
        }
        get {
            return target.frame.origin.x
        }
    }
    
    var minY: CGFloat {
        set {
            var frame = target.frame
            frame.origin.y = newValue
            target.frame = frame
        }
        get {
            return target.frame.origin.y
        }
    }
    
    var centerX: CGFloat {
        set {
            var center = target.center
            center.x = newValue
            target.center = center
        }
        get {
            return target.center.x
        }
    }
    
    var centerY: CGFloat {
        set {
            var center = target.center
            center.y = newValue
            target.center = center
        }
        get {
            return target.center.y
        }
    }
    
    var maxX: CGFloat {
        set {
            var frame = target.frame
            frame.origin.x = newValue - target.inx.height
            target.frame = frame
        }
        get {
            return target.inx.minX + target.inx.height
        }
    }
    
    var maxY: CGFloat {
        set {
            var frame = target.frame
            frame.origin.y = newValue - target.inx.width
            target.frame = frame
        }
        get {
            return target.inx.minY + target.inx.width
        }
    }
    
    var height: CGFloat {
        set {
            var frame = target.frame
            frame.size.height = newValue
            target.frame = frame
        }
        get {
            return target.frame.height
        }
    }
    
    var width: CGFloat {
        set {
            var frame = target.frame
            frame.size.width = newValue
            target.frame = frame
        }
        get {
            return target.frame.width
        }
    }
    
    var origin: CGPoint {
        get {
            return target.frame.origin
        }
        set {
            var frame = target.frame
            frame.origin = newValue
            target.frame = frame
        }
    }
    
    var size: CGSize {
        get {
            return target.frame.size
        }
        set {
            var frame = target.frame
            frame.size = newValue
            target.frame = frame
        }
    }
    
    func removeAllSubviews() {
        while target.subviews.count > 0 {
            target.subviews.last?.removeFromSuperview()
        }
    }
}
