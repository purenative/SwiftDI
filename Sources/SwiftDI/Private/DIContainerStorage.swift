//
// DIContainerStorage.swift
// SwiftDI
//
// MIT License
//
// Copyright (c) 2022 Pure Native
//

import Foundation

final class DIContainerStorage<OP: DIObjectProvider> {
    
    private var providers = [DIEntityTypeKey: OP]()
    
    func register<E>(_ type: E.Type, factory: @escaping () -> E)  {
        let provider = OP(factory: factory as () -> Any)
        let key = DIEntityTypeKey(type, scope: OP.scope)
        providers[key] = provider
    }
    
    func register<E, RE>(_ type: E.Type, relativeType: RE.Type, factory: @escaping () -> E) {
        let provider = OP(factory: factory as () -> Any)
        let key = DIEntityTypeKey(type, relativeTo: relativeType, scope: OP.scope)
        providers[key] = provider
    }
    
    func load<E>(_ type: E.Type) -> E {
        let key = DIEntityTypeKey(type, scope: OP.scope)
        let provider = providers[key]!
        return provider.provide() as! E
    }
    
    func load<E, RE>(_ type: E.Type, relativeType: RE.Type) -> E {
        let key = DIEntityTypeKey(type, relativeTo: relativeType, scope: OP.scope)
        let provider = providers[key]!
        return provider.provide() as! E
    }
    
    func typeExists<T>(_ type: T.Type) -> Bool {
        let key = DIEntityTypeKey(type, scope: OP.scope)
        return providers.keys.contains(key)
    }
    
}
