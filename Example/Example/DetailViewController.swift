//
//  DetailViewController.swift
//  Example
//
//  Created by cheyun on 2019/11/12.
//  Copyright © 2019 ixxxxx.com. All rights reserved.
//

import UIKit
import Inxis

class DetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        
        if UIColor.inx.RGB(10, green: 1, blue: 11) == UIColor.inx.RGBA(10, green: 1, blue: 11, alpha: 0.5) {
            print("颜色相同======")
        } else {
            print("颜色不相同xxxxxx")
        }
        
//        let color = UIColor.inx.gradient([UIColor.red, UIColor.yellow], size: CGSize(width: view.inx.width, height: 88))
        let img = UIImage.inx.gradient([UIColor.red, UIColor.yellow], size: CGSize(width: view.inx.width, height: 88))
        barConfig = BarConfig(image: img, translucent: false)
//        self.navigationController?.navigationBar.setBackgroundImage(img, for: .default)
//        self.navigationController?.navigationBar.barTintColor = .black
        
//        let image1 = UIImage.inx.image(UIColor.inx.RGB(10, green: 10, blue: 10))
//        let image2 = UIImage.inx.image(UIColor.inx.RGBA(10, green: 10, blue: 10, alpha: 1.0), size: CGSize(width: 2.0, height: 1.0))
//        if  image1?.isSame(as: image2) ?? false  {
//            print("图片相同-------")
//        } else {
//            print("图片不相同xxxxxx")
//        }
    }
}
