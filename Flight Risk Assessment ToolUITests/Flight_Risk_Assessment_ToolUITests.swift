//
//  Flight_Risk_Assessment_ToolUITests.swift
//  Flight Risk Assessment ToolUITests
//
//  Created by Jim Hopp on 8/18/17.
//  Copyright © 2017 Jim Hopp. All rights reserved.
//

import XCTest

class Flight_Risk_Assessment_ToolUITests: XCTestCase {
    let RISKTAB = "Flight Risk"
    
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
    
    func turnOffSwitch(_ id: String) -> () {
        if (XCUIApplication().switches[id].value as? String) == "1" {
            XCUIApplication().switches[id].tap()
        }
    }
    
    func turnOnSwitch(_ id: String) -> () {
        if (XCUIApplication().switches[id].value as? String) == "0" {
            XCUIApplication().switches[id].tap()
        }
    }
    
    func getScore() -> String {
        let score = XCUIApplication().staticTexts["score"]
        XCTAssertTrue(score.exists, "cannot find score")
        return score.label
    }
    
    func getRisk() -> String {
        let risk = XCUIApplication().staticTexts["risk"]
        XCTAssertTrue(risk.exists, "cannot find risk")
        return risk.label
    }
    
    func testInitialState() {
        XCUIApplication().tabBars.buttons[RISKTAB].tap()
        
        XCTAssertEqual("14", getScore(), "wrong score")
        XCTAssertEqual("Exercise Caution", getRisk(), "risk not correct")
    }
    
    func testSleep() {
        XCUIApplication().tabBars.buttons[RISKTAB].tap()
        
        XCUIApplication().segmentedControls.buttons["Slept well"].tap()
        
        XCTAssertEqual("12", getScore(), "wrong score")
        XCTAssertEqual("Exercise Caution", getRisk(), "risk not correct")
        
        XCUIApplication().segmentedControls.buttons["Not well or < 8 hrs"].tap()
        XCTAssertEqual("14", getScore(), "Score not correct")
        XCTAssertEqual("Exercise Caution", getRisk(), "Risk not correct")
    }
    
    func testFeel() {
        XCUIApplication().tabBars.buttons[RISKTAB].tap()
        
        XCUIApplication().segmentedControls.buttons["Have cold/ill"].tap()
        XCTAssertEqual("14", getScore(), "Score not correct")
        XCTAssertEqual("Exercise Caution", getRisk(), "Risk not correct")
        
        XCUIApplication().segmentedControls.buttons["Great!"].tap()
        XCTAssertEqual("10", getScore(), "Score not correct")
        XCTAssertEqual("Not Complex", getRisk(), "Risk not correct")
        
        XCUIApplication().segmentedControls.buttons["A bit off"].tap()
        XCTAssertEqual("12", getScore(), "Score not correct")
        XCTAssertEqual("Exercise Caution", getRisk(), "Risk not correct")
    }
    
    func testDestWx() {
        XCUIApplication().tabBars.buttons[RISKTAB].tap()
        
        XCUIApplication().segmentedControls.buttons["Super VFR"].tap()
        XCTAssertEqual("14", getScore(), "wrong score")
        XCTAssertEqual("Exercise Caution", getRisk(), "risk not correct")
        
        XCUIApplication().segmentedControls.buttons["Marginal VFR"].tap()
        XCTAssertEqual("16", getScore(), "wrong score")
        XCTAssertEqual("Exercise Caution", getRisk(), "risk not correct")
        
        XCUIApplication().segmentedControls.buttons["Not VFR"].tap()
        XCTAssertEqual("17", getScore(), "wrong score")
        XCTAssertEqual("Exercise Caution", getRisk(), "risk not correct")
    }
    
    func testDay() {
        XCUIApplication().tabBars.buttons[RISKTAB].tap()
        
        XCUIApplication().segmentedControls.buttons["Nothing going right"].tap()
        XCTAssertEqual("14", getScore(), "wrong score")
        XCTAssertEqual("Exercise Caution", getRisk(), "risk not correct")
        
        XCUIApplication().segmentedControls.buttons["Great day"].tap()
        XCTAssertEqual("11", getScore(), "wrong score")
        XCTAssertEqual("Exercise Caution", getRisk(), "risk not correct")
        
    }

    func testFlight() {
        XCUIApplication().tabBars.buttons[RISKTAB].tap()
        
        XCUIApplication().segmentedControls.buttons["Day"].tap()
        XCTAssertEqual("14", getScore(), "wrong score")
        XCTAssertEqual("Exercise Caution", getRisk(), "risk not correct")
        
        XCUIApplication().segmentedControls.buttons["Night"].tap()
        XCTAssertEqual("16", getScore(), "wrong score")
        XCTAssertEqual("Exercise Caution", getRisk(), "risk not correct")
        
    }
    
    func testPreflight() {
        XCUIApplication().tabBars.buttons[RISKTAB].tap()
        
        XCUIApplication().segmentedControls.buttons["Rushed to get off"].tap()
        XCTAssertEqual("14", getScore(), "wrong score")
        XCTAssertEqual("Exercise Caution", getRisk(), "risk not correct")
        
        XCUIApplication().segmentedControls.buttons["No hurry"].tap()
        XCTAssertEqual("12", getScore(), "wrong score")
        XCTAssertEqual("Exercise Caution", getRisk(), "risk not correct")
        
    }

    func testPlanning() {
        XCUIApplication().tabBars.buttons[RISKTAB].tap()
        
        XCUIApplication().segmentedControls.buttons["Used charts & computer"].tap()
        XCTAssertEqual("14", getScore(), "wrong score")
        XCTAssertEqual("Exercise Caution", getRisk(), "risk not correct")
        
        XCUIApplication().segmentedControls.buttons["Computer only"].tap()
        XCTAssertEqual("17", getScore(), "wrong score")
        XCTAssertEqual("Exercise Caution", getRisk(), "risk not correct")
        
    }

    func testWeightAndBalance() {
        XCUIApplication().tabBars.buttons[RISKTAB].tap()
        
        turnOnSwitch("WB")
        XCTAssertEqual("14", getScore(), "wrong score")
        XCTAssertEqual("Exercise Caution", getRisk(), "risk not correct")
        
        turnOffSwitch("WB")
        XCTAssertEqual("17", getScore(), "wrong score")
        XCTAssertEqual("Exercise Caution", getRisk(), "risk not correct")
    }

    func testPerf() {
        XCUIApplication().tabBars.buttons[RISKTAB].tap()
        
        turnOnSwitch("PERF")
        XCTAssertEqual("14", getScore(), "wrong score")
        XCTAssertEqual("Exercise Caution", getRisk(), "risk not correct")
        
        turnOffSwitch("PERF")
        XCTAssertEqual("17", getScore(), "wrong score")
        XCTAssertEqual("Exercise Caution", getRisk(), "risk not correct")
    }

    func testPaxBriefing() {
        XCUIApplication().tabBars.buttons[RISKTAB].tap()
        
        turnOnSwitch("PAX")
        XCTAssertEqual("14", getScore(), "wrong score")
        XCTAssertEqual("Exercise Caution", getRisk(), "risk not correct")
        
        turnOffSwitch("PAX")
        XCTAssertEqual("16", getScore(), "wrong score")
        XCTAssertEqual("Exercise Caution", getRisk(), "risk not correct")
    }
    
    func testLowestRisk() {
        XCUIApplication().tabBars.buttons[RISKTAB].tap()
        
        XCUIApplication().segmentedControls.buttons["Slept well"].tap()
        XCUIApplication().segmentedControls.buttons["Great!"].tap()
        XCUIApplication().segmentedControls.buttons["Super VFR"].tap()
        XCUIApplication().segmentedControls.buttons["Great day"].tap()
        XCUIApplication().segmentedControls.buttons["Day"].tap()
        XCUIApplication().segmentedControls.buttons["No hurry"].tap()
        XCUIApplication().segmentedControls.buttons["Used charts & computer"].tap()
        
        turnOnSwitch("WB")
        turnOnSwitch("PERF")
        turnOnSwitch("PAX")

        XCTAssertEqual("3", getScore(), "wrong score")
        XCTAssertEqual("Not Complex", getRisk(), "risk not correct")
    }

    func testHighestRisk() {
        XCUIApplication().tabBars.buttons[RISKTAB].tap()
        
        XCUIApplication().segmentedControls.buttons["Not well or < 8 hrs"].tap()
        XCUIApplication().segmentedControls.buttons["Have cold/ill"].tap()
        XCUIApplication().segmentedControls.buttons["Not VFR"].tap()
        XCUIApplication().segmentedControls.buttons["Nothing going right"].tap()
        XCUIApplication().segmentedControls.buttons["Night"].tap()
        XCUIApplication().segmentedControls.buttons["Rushed to get off"].tap()
        XCUIApplication().segmentedControls.buttons["Computer only"].tap()
        
        turnOffSwitch("WB")
        turnOffSwitch("PERF")
        turnOffSwitch("PAX")
        
        XCTAssertEqual("30", getScore(), "wrong score")
        XCTAssertEqual("Area of Concern", getRisk(), "risk not correct")
    }
    
    func testLandscape() {
        XCUIDevice.shared().orientation = .landscapeRight
        
        XCUIApplication().tabBars.buttons[RISKTAB].tap()
        
        turnOnSwitch("PAX")
        XCTAssertEqual("14", getScore(), "wrong score")
        XCTAssertEqual("Exercise Caution", getRisk(), "risk not correct")
        
        turnOffSwitch("PAX")
        XCTAssertEqual("16", getScore(), "wrong score")
        XCTAssertEqual("Exercise Caution", getRisk(), "risk not correct")
    }
}
