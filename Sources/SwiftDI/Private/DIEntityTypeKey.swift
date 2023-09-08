//
// DIEntityTypeKey.swift
// SwiftDI
//
// MIT License
//
// Copyright (c) 2022 Pure Native
//

import Foundation

final class DIEntityTypeKey: Hashable {
    
    let entityName: String
    let relativeEntitiName: String?
    let scope: DIObjectScope
    
    init<E>(_ type: E.Type, scope: DIObjectScope) {
        entityName = String(describing: type)
        relativeEntitiName = nil
        self.scope = scope
    }
    
    init<E, RE>(_ type: E.Type, relativeTo relativeType: RE.Type, scope: DIObjectScope) {
        entityName = String(describing: type)
        relativeEntitiName = String(describing: relativeType)
        self.scope = scope
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(entityName)
        hasher.combine(relativeEntitiName)
        hasher.combine(scope)
    }
    
    static func ==(lhs: DIEntityTypeKey, rhs: DIEntityTypeKey) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
}
