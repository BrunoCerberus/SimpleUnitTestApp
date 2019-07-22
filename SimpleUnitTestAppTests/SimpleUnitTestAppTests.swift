//
//  SimpleUnitTestAppTests.swift
//  SimpleUnitTestAppTests
//
//  Created by Bruno Lopes de Mello on 18/07/19.
//  Copyright © 2019 Bruno Lopes de Mello. All rights reserved.
//

import XCTest
@testable import SimpleUnitTestApp

class SimpleUnitTestAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTipCalc() {
        let tc = TipCalc()
        let tip = tc.calcTip(ammount: 128.51, tipPerc: 50.0)
        
        XCTAssertEqual(64.26, tip, accuracy: 0.01, "tip was wrong for 50%")
    }
    
    func testUnitTest() {
        var x: Int
        x = 2
        XCTAssertTrue(x == 2, "x should equal 2")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
