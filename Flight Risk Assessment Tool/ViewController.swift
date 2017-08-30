//
//  ViewController.swift
//  Flight Risk Assessment Tool
//
//  Created by Jim Hopp on 8/18/17.
//  Copyright © 2017 Jim Hopp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var sleep: UISegmentedControl!
    @IBOutlet var feel: UISegmentedControl!
    @IBOutlet var destWx: UISegmentedControl!
    @IBOutlet var day: UISegmentedControl!
    @IBOutlet var flight: UISegmentedControl!
    @IBOutlet var total: UILabel!
    @IBOutlet var risk: UILabel!
    
    let SLEEP = 0
    let FEEL = 1
    let DESTWX = 2
    let DAY = 3
    let FLIGHT = 4
    
    enum FlightRisk {
        case notComplex
        case caution
        case concern
    }
    
    let factors : [[Int]] = [[2,0], [4,0,2], [1,3,4], [3, 0], [1, 3]]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateScore()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func somethingChanged(_ sender: Any) {
        updateScore()
    }
    
    func updateScore() -> () {
        total.text = String(calcScore())
        
        switch computeFlightRisk() {
        case .notComplex:
            risk.text = "Not Complex"
        case .caution:
            risk.text = "Exercise Caution"
        case .concern:
            risk.text = "Area of Concern"
        }
    }
    
    func calcScore() -> Int {
        return factors[SLEEP][sleep.selectedSegmentIndex] + factors[FEEL][feel.selectedSegmentIndex] + factors[DESTWX][destWx.selectedSegmentIndex] + factors[DAY][day.selectedSegmentIndex] + factors[FLIGHT][flight.selectedSegmentIndex]
    }
    
    func computeFlightRisk() -> FlightRisk {
        switch calcScore() {
        case 0...10:
            return .notComplex
        case 11...20:
            return .caution
        default:
            return .concern
        }
    }
}

