//
//  NSFileManager+inx.swift
//  Inxis
//
//  Created by cheyun on 2019/11/12.
//  Copyright © 2019 ixxxxx.com. All rights reserved.
//

import Foundation

public extension Assistant where Target: FileManager {
    
    static var docmentsURL: URL {
        get { return self.url(for: .documentDirectory) }
        
    }
    
    static var docmentsPath: String {
        get { return self.path(for: .documentDirectory) }
    }
    
    static var libraryURL: URL {
        get { return self.url(for: .libraryDirectory) }
    }
    
    static var libraryPath: String {
        get { self.path(for: .libraryDirectory) }
    }
    
    static var cachesURL: URL {
        get { self.url(for: .cachesDirectory) }
    }
    
    static var cachesPath: String {
        get { return self.path(for: .cachesDirectory) }
    }
    
    static private func url(for directory: FileManager.SearchPathDirectory) -> URL {
        
        return Target.default.urls(for: directory, in: .userDomainMask).last!
    }
    
    static private func path(for directory: FileManager.SearchPathDirectory) -> String {
        
        return NSSearchPathForDirectoriesInDomains(directory, .userDomainMask, true).first!
    }
}
