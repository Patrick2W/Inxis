//
//  UIDevice+inx.swift
//  Inxis
//
//  Created by cheyun on 2019/11/13.
//  Copyright © 2019 ixxxxx.com. All rights reserved.
//

import UIKit

extension Assistant where Target: UIDevice {
    
    static var hasCamera: Bool {
        get { return UIImagePickerController.isSourceTypeAvailable(.camera) }
    }
    
    static var cpuCount: Int {
        get { return ProcessInfo.processInfo.activeProcessorCount }
    }
    
    static var isSimulator: Bool {
        get {
            #if TARGET_OS_SIMULATOR
            return true
            #else
            return false
            #endif
        }
    }
}
