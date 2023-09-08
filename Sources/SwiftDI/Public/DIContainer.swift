//
// DIContainer.swift
// SwiftDI
//
// MIT License
//
// Copyright (c) 2022 Pure Native
//

import Foundation

public class DIContainer {
    
    private let fabricStorage = DIContainerStorage<DIFabricObjectProvider>()
    private let instanceStorage = DIContainerStorage<DIInstanceObjectProvider>()
    
    public init() {
        
    }
    
    public func registerDependency<E>(_ type: E.Type,
                                      scope: DIObjectScope = .fabric,
                                      factory: @escaping () -> E) {
        
        switch scope {
        case .fabric:
            fabricStorage.register(type, factory: factory)
            
        case .instance:
            instanceStorage.register(type, factory: factory)
        }
        
    }
    
    public func registerDependency<E, RE>(_ type: E.Type,
                                          relativeTo relativeType: RE.Type,
                                          scope: DIObjectScope = .fabric,
                                          factory: @escaping () -> E) {
        
        switch scope {
        case .fabric:
            fabricStorage.register(type, relativeType: relativeType, factory: factory)
            
        case .instance:
            instanceStorage.register(type, relativeType: relativeType, factory: factory)
        }
        
    }
    
    public func loadDependency<E>() -> E {
        if instanceStorage.typeExists(E.self) {
            return instanceStorage.load(E.self)
        }
        if fabricStorage.typeExists(E.self) {
            return fabricStorage.load(E.self)
        }
        fatalError("Type \(String(describing: E.self)) not registered")
    }
    
    public func loadDependency<E, RE>(relativeTo relativeEntity: RE) -> E {
        if instanceStorage.typeExists(E.self) {
            return instanceStorage.load(E.self, relativeType: RE.self)
        }
        if fabricStorage.typeExists(E.self) {
            return fabricStorage.load(E.self, relativeType: RE.self)
        }
        fatalError("Type \(String(describing: E.self)) relative to \(String(describing: RE.self)) not registered")
    }
    
}
