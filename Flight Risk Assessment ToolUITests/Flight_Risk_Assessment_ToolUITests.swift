//
//  Flight_Risk_Assessment_ToolUITests.swift
//  Flight Risk Assessment ToolUITests
//
//  Created by Jim Hopp on 8/18/17.
//  Copyright © 2017 Jim Hopp. All rights reserved.
//

import XCTest

class Flight_Risk_Assessment_ToolUITests: XCTestCase {
    
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
    
    func testInitialState() {
        XCTAssertTrue(XCUIApplication().staticTexts["7"].exists,
                       "Initial score not correct")
        XCTAssertTrue(XCUIApplication().staticTexts["Not Complex"].exists,
                      "Initial risk not correct")
        
    }
    
    func testSleep() {
        XCUIApplication().segmentedControls.buttons["Slept well"].tap()
        XCTAssertTrue(XCUIApplication().staticTexts["5"].exists,
                      "Score not correct")
        XCTAssertTrue(XCUIApplication().staticTexts["Not Complex"].exists,
                      "Risk not correct")
        
        XCUIApplication().segmentedControls.buttons["Not well or < 8 hrs"].tap()
        XCTAssertTrue(XCUIApplication().staticTexts["7"].exists,
                      "Score not correct")
        XCTAssertTrue(XCUIApplication().staticTexts["Not Complex"].exists,
                      "Risk not correct")

    }
    
    func testFeel() {
        XCUIApplication().segmentedControls.buttons["Have cold/ill"].tap()
        XCTAssertTrue(XCUIApplication().staticTexts["7"].exists,
                      "Score not correct")
        XCTAssertTrue(XCUIApplication().staticTexts["Not Complex"].exists,
                      "Risk not correct")
        
        XCUIApplication().segmentedControls.buttons["Great!"].tap()
        XCTAssertTrue(XCUIApplication().staticTexts["3"].exists,
                      "Score not correct")
        XCTAssertTrue(XCUIApplication().staticTexts["Not Complex"].exists,
                      "Risk not correct")
        
        XCUIApplication().segmentedControls.buttons["A bit off"].tap()
        XCTAssertTrue(XCUIApplication().staticTexts["5"].exists,
                      "Score not correct")
        XCTAssertTrue(XCUIApplication().staticTexts["Not Complex"].exists,
                      "Risk not correct")
    }
    
    func testDestWx() {
        XCUIApplication().segmentedControls.buttons["Super VFR"].tap()
        XCTAssertTrue(XCUIApplication().staticTexts["7"].exists,
                      "Score not correct")
        XCTAssertTrue(XCUIApplication().staticTexts["Worthy of Consideration"].exists,
                      "Risk not correct")
        
        XCUIApplication().segmentedControls.buttons["Marginal VFR"].tap()
        XCTAssertTrue(XCUIApplication().staticTexts["9"].exists,
                      "Score not correct")
        XCTAssertTrue(XCUIApplication().staticTexts["Not Complex"].exists,
                      "Risk not correct")
        
        XCUIApplication().segmentedControls.buttons["Not VFR"].tap()
        XCTAssertTrue(XCUIApplication().staticTexts["10"].exists,
                      "Score not correct")
        XCTAssertTrue(XCUIApplication().staticTexts["Not Complex"].exists,
                      "Risk not correct")
    }
}
