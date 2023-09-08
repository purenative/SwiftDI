//
// SwiftDITests.swift
// SwiftDI
//
// MIT License
//
// Copyright (c) 2022 Pure Native
//

import XCTest
@testable import SwiftDI

class Test1 {
    
}

class Test2 {
    
}

final class SwiftDITests: XCTestCase {
    
    func testExample() throws {
        
        let container = DIContainer()
        
        let test2 = Test2()
        
        let test1: Test1 = container.loadDependency(relativeTo: test2)
        
    }
    
}
