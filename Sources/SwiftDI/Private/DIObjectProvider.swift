//
// DIObjectProvider.swift
// SwiftDI
//
// MIT License
//
// Copyright (c) 2022 Pure Native
//

import Foundation

protocol DIObjectProvider {
    
    static var scope: DIObjectScope { get }
    
    init(factory: @escaping () -> Any)
    
    func provide() -> Any
    
}
