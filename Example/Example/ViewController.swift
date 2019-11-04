//
//  ViewController.swift
//  Example
//
//  Created by cheyun on 2019/11/1.
//  Copyright © 2019 ixxxxx.com. All rights reserved.
//

import UIKit
import Inxis

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //showViewFrame()
        showNowInfo()
    }
    
    func showViewFrame() {
        print("view.x: \(view.inx.minX)")
        print("view.y: \(view.inx.minY)")
        print("view.centerX: \(view.inx.centerX)")
        print("view.centerY: \(view.inx.centerY)")
        print("view.bottom: \(view.inx.maxX)")
        print("view.right: \(view.inx.maxY)")
        print("view.width: \(view.inx.width)")
        print("view.height: \(view.inx.height)")
    }
    
    func showNowInfo() {
        let now = NSDate.now as NSDate
        print("year: \(now.inx.year)")
        print("month: \(now.inx.month)")
        print("day: \(now.inx.day)")
        print("hour: \(now.inx.hour)")
        print("minute: \(now.inx.minute)")
        print("secend: \(now.inx.secend)")
        print("weekDay: \(now.inx.weekDay)")
        print("weekdayOrdinal: \(now.inx.weekdayOrdinal)")
        print("weekOfMonth: \(now.inx.weekOfMonth)")
        print("weekOfYear: \(now.inx.weekOfYear)")
    }
    
}

