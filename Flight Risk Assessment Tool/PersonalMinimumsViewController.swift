//
//  PersonalMinimumsViewController.swift
//  Flight Risk Assessment Tool
//
//  Created by Jim Hopp on 11/14/17.
//  Copyright © 2017 Jim Hopp. All rights reserved.
//

import UIKit

class PersonalMinimumsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var ceilingDay: UITextField!
    @IBOutlet var vizDay: UITextField!
    @IBOutlet var ceilingNight: UITextField!
    @IBOutlet var vizNight: UITextField!
    @IBOutlet var wind: UITextField!
    @IBOutlet var xwind: UITextField!
    @IBOutlet var runway: UITextField!
    @IBOutlet var elevation: UITextField!
    @IBOutlet var densityAlt: UITextField!

    static var mins = [String: String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ceilingDay.text = PersonalMinimumsViewController.mins["ceiling.day"]
        vizDay.text = PersonalMinimumsViewController.mins["visibility.day"]
        ceilingNight.text = PersonalMinimumsViewController.mins["ceiling.night"]
        vizNight.text = PersonalMinimumsViewController.mins["visibility.night"]
        wind.text = PersonalMinimumsViewController.mins["surfacewind"]
        xwind.text = PersonalMinimumsViewController.mins["crosswind"]
        runway.text = PersonalMinimumsViewController.mins["runwaylen"]
        elevation.text = PersonalMinimumsViewController.mins["fieldelevation"]
        densityAlt.text = PersonalMinimumsViewController.mins["densityaltitude"]

        ceilingDay.delegate = self
        ceilingNight.delegate = self
        vizDay.delegate = self
        vizNight.delegate = self
        wind.delegate = self
        xwind.delegate = self
        runway.delegate = self
        elevation.delegate = self
        densityAlt.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    static func loadMins(_ dict: NSDictionary) {
        mins.removeAll()
        for (key, value) in dict {
            mins[key as! String] = value as? String
        }
    }
    
    @IBAction func ceilingDayChanged(_ sender: Any) {
        PersonalMinimumsViewController.mins["ceiling.day"] = ceilingDay.text
    }
    
    @IBAction func visibilityDayChanged(_ sender: Any) {
        PersonalMinimumsViewController.mins["visibility.day"] = vizDay.text
    }
    
    @IBAction func ceilingNightChanged(_ sender: Any) {
        PersonalMinimumsViewController.mins["ceiling.night"] = ceilingNight.text
    }
    
    @IBAction func visibilityNightChanged(_ sender: Any) {
        PersonalMinimumsViewController.mins["visibility.night"] = vizNight.text
    }
    
    @IBAction func surfaceWindChanged(_ sender: Any) {
        PersonalMinimumsViewController.mins["surfacewind"] = wind.text
    }
    
    @IBAction func crosswindChanged(_ sender: Any) {
        PersonalMinimumsViewController.mins["crosswind"] = xwind.text
    }
    
    @IBAction func runwayLenChanged(_ sender: Any) {
        PersonalMinimumsViewController.mins["runwaylen"] = runway.text
    }
    
    @IBAction func elevationChanged(_ sender: Any) {
        PersonalMinimumsViewController.mins["fieldelevation"] = elevation.text
    }
    
    @IBAction func densityAltChanged(_ sender: Any) {
        PersonalMinimumsViewController.mins["densityaltitude"] = densityAlt.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
