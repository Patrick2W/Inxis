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
        
        title = "首页"
//        let img = UIImage.inx.image(.blue)
        let img = UIImage.inx.gradient([UIColor.red, UIColor.yellow],
                                       size: CGSize(width: view.inx.width, height: 88))
        barConfig = BarConfig(titleFont: UIFont.systemFont(ofSize: 17), image: img, translucent: false, style: .black)
        
//        showViewFrame()
        showNowInfo()
//        setGradientBackground()
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
        print("endDayOfMonth: \(now.inx.endDayOfMonth!)")
        print("firstDayOfMonth: \(now.inx.firstDayOfMonth!)")
        
        print(now.inx.toString("yyyy-MM-dd"))
        let adding = now.inx.date(byAdding: 0, months: 1, years: -1) as NSDate?
        if let add = adding {
            print("result: " + add.inx.toString("yyyy-MM-dd"))
        }
        
        if now.inx.yesterday.inx.isYesterday {
            print("Yesterday !!!!!")
        }
    }
    
    func setGradientBackground() {
        
//        self.view.backgroundColor = UIColor.inx.hex(0x4da9ff)
//        let color = UIColor.inx.gradient([.black, .white], size: CGSize(width: view.inx.width, height: 1))
//        self.view.backgroundColor = color
        self.view.backgroundColor = UIColor.inx.random
    }
    
    @IBAction func pushButtonTouchHandler() {
        let detail = DetailViewController.inx.load("Main", idfer: "DetailViewController")
        self.inx.push(to: detail, transition: .curlUp)
    }
}

