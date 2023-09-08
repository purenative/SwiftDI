//
// DIInstanceObjectProvider.swift
// SwiftDI
//
// MIT License
//
// Copyright (c) 2022 Pure Native
//

import Foundation

final class DIInstanceObjectProvider: DIObjectProvider {
    
    private var _instance: Any!
    
    static var scope: DIObjectScope {
        .instance
    }
    
    let factory: () -> Any
    
    init(factory: @escaping () -> Any) {
        self.factory = factory
    }
    
    func provide() -> Any {
        if let instance = _instance {
            return instance
        }
        
        _instance = factory()
        return _instance!
    }
    
}
