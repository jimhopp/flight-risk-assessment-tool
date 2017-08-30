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
    
    func testPreflight() {
        XCTAssertEqual(3, self.viewController.factors[5][0], "'rushed' preflight factor wrong")
        XCTAssertEqual(1, self.viewController.factors[5][1], "'no hurry' preflight factor wrong")
    }
    
    func testPlanning() {
        XCTAssertEqual(0, self.viewController.factors[6][0], "'charts + computer' planning factor wrong")
        XCTAssertEqual(3, self.viewController.factors[6][1], "'computer only' planning factor wrong")
    }

    func testWeightAndBalance() {
        XCTAssertEqual(0, self.viewController.factors[7][0], "'calculated' w&b factor wrong")
        XCTAssertEqual(3, self.viewController.factors[7][1], "'no calc' w&b factor wrong")
    }
    
    func testPerf() {
        XCTAssertEqual(0, self.viewController.factors[8][0], "'calculated' perf factor wrong")
        XCTAssertEqual(3, self.viewController.factors[8][1], "'no calc' perf factor wrong")
    }

    func testPaxBriefing() {
        XCTAssertEqual(0, self.viewController.factors[9][0], "'briefed' pax factor wrong")
        XCTAssertEqual(2, self.viewController.factors[9][1], "'not briefed' pax factor wrong")
    }
    
    func testNoConcern() {
        XCTAssertEqual(ViewController.FlightRisk.notComplex, ViewController.computeFlightRisk(0), "'not complex' lower bound wrong")
        XCTAssertEqual(ViewController.FlightRisk.notComplex, ViewController.computeFlightRisk(10), "'not complex' upper bound wrong")
    }

    func testCaution() {
        XCTAssertEqual(ViewController.FlightRisk.caution, ViewController.computeFlightRisk(11), "'caution' lower bound wrong")
        XCTAssertEqual(ViewController.FlightRisk.caution, ViewController.computeFlightRisk(20), "'caution' upper bound wrong")
    }
    
    func testConcern() {
        XCTAssertEqual(ViewController.FlightRisk.concern, ViewController.computeFlightRisk(21), "'concern' lower bound wrong")
        XCTAssertEqual(ViewController.FlightRisk.concern, ViewController.computeFlightRisk(30), "'concern' upper bound wrong")
    }
    
    func testOutofRange() {
        XCTAssertEqual(ViewController.FlightRisk.concern, ViewController.computeFlightRisk(-1), "out of range score wrong")
        XCTAssertEqual(ViewController.FlightRisk.concern, ViewController.computeFlightRisk(31), "out of range wrong")
        XCTAssertEqual(ViewController.FlightRisk.concern, ViewController.computeFlightRisk(1000000), "out of range wrong")
    }
}
