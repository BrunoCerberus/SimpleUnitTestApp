//
//  MusicTests.swift
//  SimpleUnitTestAppTests
//
//  Created by Bruno Lopes de Mello on 18/07/19.
//  Copyright © 2019 Bruno Lopes de Mello. All rights reserved.
//

import XCTest
@testable import SimpleUnitTestApp

class MusicTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testParseJSON() {
        let music = Music()
        let bundle = Bundle(for: type(of: self))
        
        if let path = bundle.path(forResource: "JSON", ofType: "txt") {
            if let data = try? Data.init(contentsOf: URL(fileURLWithPath: path)) {
                let result = music.parseJSON(data: data)
                XCTAssertNotNil(result, "Should not be nil")
                XCTAssertGreaterThan(result!.count, 0, "Should have values")
                
            } else {
                XCTFail()
            }
        }
    }
    
    func testRefresh() {
        let music = MockMusic()
        music.refresh()
        XCTAssertNotNil(music.cache, "the cache should not nil")
    }
    
    func testFetch() {
        let exp = expectation(description: "server fetch")
        let music = Music()
        music.fetchMusic { (items, error) in
            if error != nil {
                XCTFail()
            }
            XCTAssertNotNil(items, "Items should not be nil")
            XCTAssertTrue(items!.count > 0, "Items should not be empty")
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 10.0) { (error) in
            print(error?.localizedDescription ?? "")
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
