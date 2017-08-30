//
//  Flight_Risk_Assessment_ToolTests.swift
//  Flight Risk Assessment ToolTests
//
//  Created by Jim Hopp on 8/18/17.
//  Copyright © 2017 Jim Hopp. All rights reserved.
//

import XCTest
@testable import Flight_Risk_Assessment_Tool

class Flight_Risk_Assessment_ToolTests: XCTestCase {
    
    var viewController = ViewController()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSleep() {
        XCTAssertEqual(2, self.viewController.factors[0][0], "Poor sleep factor wrong")
        XCTAssertEqual(0, self.viewController.factors[0][1], "Good sleep factor wrong")
    }
    
    func testFeel() {
        XCTAssertEqual(4, self.viewController.factors[1][0], "'cold' feel factor wrong")
        XCTAssertEqual(0, self.viewController.factors[1][1], "'great' feel factor wrong")
        XCTAssertEqual(2, self.viewController.factors[1][2], "'bit off' feel factor wrong")
    }
    
    func testDestWx() {
        XCTAssertEqual(1, self.viewController.factors[2][0], "super vmc dest wx factor wrong")
        XCTAssertEqual(3, self.viewController.factors[2][1], "marg. vmc dest wx factor wrong")
        XCTAssertEqual(4, self.viewController.factors[2][2], "imc dest wx factor wrong")
    }

    func testDay() {
        XCTAssertEqual(3, self.viewController.factors[3][0], "bad day factor wrong")
        XCTAssertEqual(3, self.viewController.factors[3][0], "great day factor wrong")
    }

    func testFlight() {
        XCTAssertEqual(1, self.viewController.factors[4][0], "'day flight factor wrong")
        XCTAssertEqual(3, self.viewController.factors[4][1], "'night' flight factor wrong")
    }
}
