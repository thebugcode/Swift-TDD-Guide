//
//  ErrorHandlingExampleTests.swift
//  ErrorHandlingExampleTests
//
//  Created by Dan Ursu on 06/02/16.
//  Copyright © 2016 Dan Ursu. All rights reserved.
//

import XCTest
@testable import ErrorHandlingExample

func XCTAssertDoesntThrow(methodCall: () throws -> ()) {
    do {
        try methodCall()
    } catch {
        XCTFail()
    }
}


func XCTAssertThrows(methodCall: () throws -> ()		) {
    var didThrow = false
    do {
        try methodCall()
    } catch  {
        didThrow = true
    }
    
    XCTAssertTrue(didThrow)
}


class ErrorHandlingExampleTests: XCTestCase {
    
    func testIFXCTAssertThrowsPassesForThrowingFunction() {
        XCTAssertThrows {
            let vc = ViewController()
            try vc.throwingFunction()
        }
    }

    
    func testThatXCTAssertDoesntThrowPassesIfMethodDoesntThrow() {
        XCTAssertDoesntThrow {
            let vc = ViewController()
            try vc.nonThrowingFunction()
        }
    }
    

}



