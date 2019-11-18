//
//  Equals.swift
//  Inxis
//
//  Created by cheyun on 2019/11/18.
//  Copyright © 2019 ixxxxx.com. All rights reserved.
//

import UIKit

protocol InxEqual {
    func isSame(as other: Self?) -> Bool
}

extension Float : InxEqual {
    func isSame(as other: Float?) -> Bool {
        guard let otr = other else {
            return false
        }
        let num1 = Int(self * 1000)
        let num2 = Int(otr * 1000)
        return num1 == num2
    }
}

extension UIImage: InxEqual {
    func isSame(as other: UIImage?) -> Bool {
        if self == other { return true }
        guard let img = other else {
            return false
        }
        if let dt1 = self.pngData(), let dt2 = img.pngData() {
            return dt1 == dt2
        }
        if let dt1 = self.jpegData(compressionQuality: 1.0), let dt2 = img.jpegData(compressionQuality: 1.0) {
            return dt1 == dt2
        }
        return false
    }
}
