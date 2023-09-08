//
// DIFabricObjectProvider.swift
// SwiftDI
//
// MIT License
//
// Copyright (c) 2022 Pure Native
//

import Foundation

final class DIFabricObjectProvider: DIObjectProvider {
    
    static var scope: DIObjectScope {
        .fabric
    }
    
    let factory: () -> Any
    
    init(factory: @escaping () -> Any) {
        self.factory = factory
    }

    func provide() -> Any {
        factory()
    }
    
}
