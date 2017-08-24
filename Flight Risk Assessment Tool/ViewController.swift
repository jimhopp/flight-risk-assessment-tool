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
    @IBOutlet var total: UILabel!
    
    let SLEEP = 0
    let FEEL = 1
    let DESTWX = 2
    
    let factors : [[Int]] = [[2,0], [4,0,2], [1,3,4]]

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
        //let alert = UIAlertController(title: "Score", message: "something changed, score = \(score)", preferredStyle: .alert)
        //alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        //self.present(alert, animated: true)
    }
    func updateScore() -> () {
        total.text = String(calcScore())
    }
    
    func calcScore() -> Int {
        return factors[SLEEP][sleep.selectedSegmentIndex] + factors[FEEL][feel.selectedSegmentIndex] + factors[DESTWX][destWx.selectedSegmentIndex]
    }

}

