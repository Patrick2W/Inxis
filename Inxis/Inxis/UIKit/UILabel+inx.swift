//
//  UILabel+inx.swift
//  Inxis
//
//  Created by cheyun on 2019/11/13.
//  Copyright © 2019 ixxxxx.com. All rights reserved.
//

import UIKit

public extension Assistant where Target: UILabel {
    
    static func label(_ textColor: UIColor, font: UIFont) -> UILabel {
        let label = UILabel()
        label.textColor = textColor
        label.font = font
        return label
    }
}
