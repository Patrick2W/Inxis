//
//  Assistant.swift
//  Inxis
//
//  Created by cheyun on 2019/11/1.
//  Copyright © 2019 ixxxxx.com. All rights reserved.
//

import class Foundation.NSObject

public struct Assistant<Target> {
    let target: Target
    init(_ target: Target) {
        self.target = target
    }
}

public protocol AssistantProtocol {
    associatedtype TargetBase
    static var inx: Assistant<TargetBase>.Type { get set }
    
    var inx: Assistant<TargetBase> { get set }
}

public extension AssistantProtocol {
    
    static var inx: Assistant<Self>.Type {
        get {
            return Assistant<Self>.self
        }
        set {
            
        }
    }
    
    var inx: Assistant<Self> {
        get {
            return Assistant(self)
        }
        set {
            
        }
    }
}

extension NSObject: AssistantProtocol { }
