//
//  ADMUITests.swift
//  Flight Risk Assessment ToolUITests
//
//  Created by Jim Hopp on 12/5/17.
//  Copyright © 2017 Jim Hopp. All rights reserved.
//

import XCTest

class ADMUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        XCUIDevice.shared().orientation = .portrait
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testADMTab() {
        XCUIApplication().tabBars.buttons["ADM"].tap()
    }
}
