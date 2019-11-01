//
//  Assistant.swift
//  Inxis
//
//  Created by cheyun on 2019/11/1.
//  Copyright © 2019 ixxxxx.com. All rights reserved.
//

import class Foundation.NSObject

public struct Assistant<Target> {
    public let target: Target
    public init(_ target: Target) {
        self.target = target
    }
}

public protocol AssistantProtocol {
    associatedtype TargetBase
    static var inx: Assistant<Self>.Type { get }
    
    var inx: Assistant<Self>.Type { get }
}

public extension AssistantProtocol {
    
    static var inx: Assistant<Self>.Type {
        get {
            return Assistant<Self>.self
        }
    }
    
    var inx: Assistant<Self> {
        get {
            return Assistant(self)
        }
    }
}
