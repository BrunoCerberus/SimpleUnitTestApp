//
//  SimpleUnitTestAppUITests.swift
//  SimpleUnitTestAppUITests
//
//  Created by Bruno Lopes de Mello on 21/07/19.
//  Copyright © 2019 Bruno Lopes de Mello. All rights reserved.
//

import XCTest

class SimpleUnitTestAppUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMyPerfTest() {
        let app = XCUIApplication()
        print(app.debugDescription)
        
        let lbl = app.staticTexts["myLabel"]
        print(lbl.label)
        
        let textField = app.otherElements.containing(.staticText, identifier:"Label").children(matching: .textField).element
        textField.tap()
        textField.typeText("123")
        app.buttons["Calculate"].tap()
        
        XCTAssertTrue(lbl.label.hasPrefix("tip"), "tip is missing")
        
        XCUIApplication().otherElements.containing(.staticText, identifier:"tip: 61.5").children(matching: .textField).element.typeText("5")
    }

}
