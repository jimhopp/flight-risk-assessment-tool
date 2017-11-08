//
//  PersonalMinimums_Tests.swift
//  Flight Risk Assessment ToolTests
//
//  Created by Jim Hopp on 11/22/17.
//  Copyright © 2017 Jim Hopp. All rights reserved.
//

import XCTest
@testable import Flight_Risk_Assessment_Tool

class PersonalMinimums_Tests: XCTestCase {

    var viewController = PersonalMinimumsViewController()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoadMinsNormal() {
        let minsNS: NSDictionary = ["1": "one", "2": "two"]
        PersonalMinimumsViewController.loadMins(minsNS)
        XCTAssertEqual(minsNS as! [String : String], PersonalMinimumsViewController.mins, "dictionaries not equal")
    }
    
    func testLoadMinsEmpty() {
        let minsNS: NSDictionary = NSDictionary.init()
        PersonalMinimumsViewController.loadMins(minsNS)
        XCTAssertEqual(minsNS as! [String:String], PersonalMinimumsViewController.mins, "empty dictionaries not equal")
    }
}
