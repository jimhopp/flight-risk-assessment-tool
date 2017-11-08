//
//  PersonalMinimusUITests.swift
//  Flight Risk Assessment ToolUITests
//
//  Created by Jim Hopp on 11/22/17.
//  Copyright © 2017 Jim Hopp. All rights reserved.
//

import XCTest

class PersonalMinimumsUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCeilingDayisSaved() {
        
        let app = XCUIApplication()
        var textField = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element(boundBy: 0)
        textField.tap()
        
        if let currString = textField.value as? String {
            let deleteString = currString.map {_ in XCUIKeyboardKeyDelete}.joined(separator: "")
            textField.typeText(deleteString)
        }
        
        textField.typeText("1500")
        app/*@START_MENU_TOKEN@*/.keyboards.buttons["Done"]/*[[".keyboards.buttons[\"Done\"]",".buttons[\"Done\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        
        XCTAssertEqual(textField.value as? String, "1500", "ceiling.day not set to 1500")
        
        XCUIDevice().press(.home)
        XCTAssertTrue(app.wait(for: .runningBackgroundSuspended, timeout: 10.0))
        app.terminate()
        app.activate()
        XCTAssertTrue(app.wait(for: .runningForeground, timeout: 10.0))
        
        textField = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element(boundBy: 0)
        
        XCTAssertEqual(textField.value as? String, "1500", "ceiling.day value not preserved between restarts")
        
    }
    
}
