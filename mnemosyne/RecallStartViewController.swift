//
//  RecallStartViewController.swift
//  mnemosyne
//
//  Created by Bhavin Gupta on 5/29/17.
//  Copyright © 2017 bhavingpt. All rights reserved.
//

import UIKit
import os.log

class RecallStartViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var spades: UISwitch!
    @IBOutlet weak var diamonds: UISwitch!
    @IBOutlet weak var hearts: UISwitch!
    @IBOutlet weak var clubs: UISwitch!
    @IBOutlet weak var start: UIButton!
    
    @IBOutlet weak var spadesLabel: UILabel!
    @IBOutlet weak var diamondsLabel: UILabel!
    @IBOutlet weak var heartsLabel: UILabel!
    @IBOutlet weak var clubsLabel: UILabel!
    
    
    let defaultString = "-------"
    
    let defaults = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        let mappings = defaults.object(forKey: "pao") as? [String] ?? Array(repeating: defaultString, count: 156)
        
        var dict = [0: [spades, spadesLabel], 39: [diamonds, diamondsLabel], 78: [hearts, heartsLabel], 117: [clubs, clubsLabel]]
        
        for key in dict.keys {
            var tempVal = false
            for i in key...(key + 38) {
                if (!tempVal) {
                    if (mappings[i] == defaultString) {
                        tempVal = true
                        (dict[key]?[0] as! UISwitch).isOn = false
                        (dict[key]?[0] as! UISwitch).isEnabled = false
                        (dict[key]?[0] as! UISwitch).tintColor = UIColor.gray
                        (dict[key]?[1] as! UILabel).textColor = UIColor.gray
                        (dict[key]?[1] as! UILabel).text = (dict[key]?[1] as! UILabel).text! + " (incomplete)"
                    }
                }
            }
            
            if (tempVal == false) {
                (dict[key]?[0] as! UISwitch).isOn = true
                (dict[key]?[0] as! UISwitch).isEnabled = true
            }
        }
        
        start.isEnabled = spades.isOn || clubs.isOn || diamonds.isOn || hearts.isOn
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    
    @IBAction func spadesChanged(_ sender: UISwitch) {
        start.isEnabled = spades.isOn || clubs.isOn || diamonds.isOn || hearts.isOn
    }
    
    @IBAction func diamondsChanged(_ sender: UISwitch) {
        start.isEnabled = spades.isOn || clubs.isOn || diamonds.isOn || hearts.isOn

    }
    
    @IBAction func heartsChanged(_ sender: UISwitch) {
        start.isEnabled = spades.isOn || clubs.isOn || diamonds.isOn || hearts.isOn

    }
    
    @IBAction func clubsChanged(_ sender: UISwitch) {
        start.isEnabled = spades.isOn || clubs.isOn || diamonds.isOn || hearts.isOn
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
