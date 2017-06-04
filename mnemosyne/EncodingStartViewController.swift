//
//  EncodingStartViewController.swift
//  mnemosyne
//
//  Created by Bhavin Gupta on 5/29/17.
//  Copyright © 2017 bhavingpt. All rights reserved.
//

import UIKit

class EncodingStartViewController: UIViewController {
    
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
    
    @IBOutlet weak var totalTime: UILabel!
    @IBOutlet weak var slider: UISlider!
    
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
                        (dict[key]?[0] as! UISwitch).tintColor = UIColor.darkGray
                        (dict[key]?[1] as! UILabel).textColor = UIColor.darkGray
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
        start.setTitleColor(start.isEnabled ? UIColor.white : UIColor.darkGray
, for: .normal)
        let numSuits = (spades.isOn ?1:0)+(clubs.isOn ?1:0)+(hearts.isOn ?1:0)+(diamonds.isOn ?1:0)
        let maxSeconds = 240 * numSuits
        let chosenSeconds = Int(0.5 * Float(maxSeconds))
        totalTime.text = String(format: "%02d", chosenSeconds / 60) + ":" + String(format: "%02d",chosenSeconds % 60 - ((chosenSeconds % 60) % 15))
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
        start.setTitleColor(start.isEnabled ? UIColor.white : UIColor.darkGray
            , for: .normal)
        let value: Float = slider.value
        let numSuits = (spades.isOn ?1:0)+(clubs.isOn ?1:0)+(hearts.isOn ?1:0)+(diamonds.isOn ?1:0)
        let maxSeconds = 240 * numSuits
        let chosenSeconds = Int(value * Float(maxSeconds))
        totalTime.text = String(format: "%02d", chosenSeconds / 60) + ":" + String(format: "%02d",chosenSeconds % 60 - ((chosenSeconds % 60) % 15))
    }
    
    @IBAction func diamondsChanged(_ sender: UISwitch) {
        start.isEnabled = spades.isOn || clubs.isOn || diamonds.isOn || hearts.isOn
        start.setTitleColor(start.isEnabled ? UIColor.white : UIColor.darkGray
            , for: .normal)
        let value: Float = slider.value
        let numSuits = (spades.isOn ?1:0)+(clubs.isOn ?1:0)+(hearts.isOn ?1:0)+(diamonds.isOn ?1:0)
        let maxSeconds = 240 * numSuits
        let chosenSeconds = Int(value * Float(maxSeconds))
        totalTime.text = String(format: "%02d", chosenSeconds / 60) + ":" + String(format: "%02d",chosenSeconds % 60 - ((chosenSeconds % 60) % 15))
    }
    
    @IBAction func heartsChanged(_ sender: UISwitch) {
        start.isEnabled = spades.isOn || clubs.isOn || diamonds.isOn || hearts.isOn
        start.setTitleColor(start.isEnabled ? UIColor.white : UIColor.darkGray
            , for: .normal)
        let value: Float = slider.value
        let numSuits = (spades.isOn ?1:0)+(clubs.isOn ?1:0)+(hearts.isOn ?1:0)+(diamonds.isOn ?1:0)
        let maxSeconds = 240 * numSuits
        let chosenSeconds = Int(value * Float(maxSeconds))
        totalTime.text = String(format: "%02d", chosenSeconds / 60) + ":" + String(format: "%02d",chosenSeconds % 60 - ((chosenSeconds % 60) % 15))
    }
    
    @IBAction func clubsChanged(_ sender: UISwitch) {
        start.isEnabled = spades.isOn || clubs.isOn || diamonds.isOn || hearts.isOn
        start.setTitleColor(start.isEnabled ? UIColor.white : UIColor.darkGray
            , for: .normal)
        let value: Float = slider.value
        let numSuits = (spades.isOn ?1:0)+(clubs.isOn ?1:0)+(hearts.isOn ?1:0)+(diamonds.isOn ?1:0)
        let maxSeconds = 240 * numSuits
        let chosenSeconds = Int(value * Float(maxSeconds))
        totalTime.text = String(format: "%02d", chosenSeconds / 60) + ":" + String(format: "%02d",chosenSeconds % 60 - ((chosenSeconds % 60) % 15))
    }
    
    @IBAction func slider(_ sender: UISlider) {
        let value: Float = sender.value
        let numSuits = (spades.isOn ?1:0)+(clubs.isOn ?1:0)+(hearts.isOn ?1:0)+(diamonds.isOn ?1:0)
        let maxSeconds = 240 * numSuits
        let chosenSeconds = Int(value * Float(maxSeconds))
        totalTime.text = String(format: "%02d", chosenSeconds / 60) + ":" + String(format: "%02d",chosenSeconds % 60 - ((chosenSeconds % 60) % 15))
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nav = segue.destination as? UINavigationController {
            if let dest = nav.viewControllers[0] as? EncodingTestViewController {
                dest.spadesOn = spades.isOn
                dest.clubsOn = clubs.isOn
                dest.diamondsOn = diamonds.isOn
                dest.heartsOn = hearts.isOn
                
                let clock = totalTime.text! // a a : b b
                
                var index = clock.index(clock.startIndex, offsetBy: 2)
                var time = 60 * Int(clock.substring(to: index))!
                
                index = clock.index(clock.startIndex, offsetBy: 3)
                time += Int(clock.substring(from: index))!
                let numCards = (spades.isOn ?13:0)+(clubs.isOn ?13:0)+(hearts.isOn ?13:0)+(diamonds.isOn ?13:0)
                
                let numGroups = numCards / 3 + ( numCards % 3 != 0 ? 1 : 0 )

                dest.interval = Double(time) / Double(numGroups)
            }
        }
        
    }
    
    @IBAction func unwindToEncodingStart(sender: UIStoryboardSegue) {
        spadesLabel.text = "Spades"
        diamondsLabel.text = "Diamonds"
        heartsLabel.text = "Hearts"
        clubsLabel.text = "Clubs"
    }
    
}
