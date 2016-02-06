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


func XCTAssertThrows(methodCall: () throws -> (), testCondition: ((didThrow: Bool) -> Void)? = nil) {
    
    var didThrow = false
    do {
        try methodCall()
    } catch  {
        didThrow = true
    }
    if let testCondition = testCondition  {
        testCondition(didThrow: didThrow)
    } else {
        XCTAssertTrue(didThrow)
    }
    
}


class ErrorHandlingExampleTests: XCTestCase {
    
    func testIFXCTAssertThrowsPassesForThrowingFunction() {
        XCTAssertThrows({
            let vc = ViewController()
            try vc.throwingFunction()
        })
    }
    
    
    func testIFXCTAssertThrowsRaisesErrorWhenGivenANonThrowingFunction() {
        XCTAssertThrows({
            let vc = ViewController()
            try vc.nonThrowingFunction()
            }) { (didThrow) in 
                XCTAssertFalse(didThrow)
        }
    }

    
    func testThatXCTAssertDoesntThrowPassesIfMethodDoesntThrow() {
        XCTAssertDoesntThrow {
            let vc = ViewController()
            try vc.nonThrowingFunction()
        }
    }
    

}



