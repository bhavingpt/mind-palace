//
//  EncodingTestViewController.swift
//  mnemosyne
//
//  Created by Bhavin Gupta on 5/31/17.
//  Copyright © 2017 bhavingpt. All rights reserved.
//

import UIKit
import GameKit

class EncodingTestViewController: UIViewController, UIPickerViewDelegate,
    UIPickerViewDataSource {
    
    var cardStrings = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack",
                        "Queen", "King"]
    var cardSuits = [" of spades", " of diamonds", " of hearts", " of clubs"]
    
    // MARK: Properties
    
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var thirdImage: UIImageView!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var congrats: UILabel!
    
    
    // MARK: Timer
    
    weak var timer: Timer?
    var startTime: Double = 0
    
    // MARK: Passed Properties
    
    var spadesOn = false
    var clubsOn = false
    var diamondsOn = false
    var heartsOn = false
    var interval: Double = 0
    
    var currentGroup: Int = -1
    var guessNumber: Int = -1
    
    var setup: Bool = true
    var cards = [Int]()
    var shuffled = [Int]()
    var shuffledCopy = [Int]()
    var groups: [[Int]] = []
    let images = [#imageLiteral(resourceName: "card0"), #imageLiteral(resourceName: "card1"), #imageLiteral(resourceName: "card2"), #imageLiteral(resourceName: "card3"), #imageLiteral(resourceName: "card4"), #imageLiteral(resourceName: "card5"), #imageLiteral(resourceName: "card6"), #imageLiteral(resourceName: "card7"), #imageLiteral(resourceName: "card8"), #imageLiteral(resourceName: "card9"), #imageLiteral(resourceName: "card10"), #imageLiteral(resourceName: "card11"), #imageLiteral(resourceName: "card12"),
                  #imageLiteral(resourceName: "card13"), #imageLiteral(resourceName: "card14"), #imageLiteral(resourceName: "card15"), #imageLiteral(resourceName: "card16"), #imageLiteral(resourceName: "card17"), #imageLiteral(resourceName: "card18"), #imageLiteral(resourceName: "card19"), #imageLiteral(resourceName: "card20"), #imageLiteral(resourceName: "card21"), #imageLiteral(resourceName: "card22"), #imageLiteral(resourceName: "card23"), #imageLiteral(resourceName: "card24"), #imageLiteral(resourceName: "card25"),
                  #imageLiteral(resourceName: "card26"), #imageLiteral(resourceName: "card27"), #imageLiteral(resourceName: "card28"), #imageLiteral(resourceName: "card29"), #imageLiteral(resourceName: "card30"), #imageLiteral(resourceName: "card31"), #imageLiteral(resourceName: "card32"), #imageLiteral(resourceName: "card33"), #imageLiteral(resourceName: "card34"), #imageLiteral(resourceName: "card35"), #imageLiteral(resourceName: "card36"), #imageLiteral(resourceName: "card37"), #imageLiteral(resourceName: "card38"),
                  #imageLiteral(resourceName: "card39"), #imageLiteral(resourceName: "card40"), #imageLiteral(resourceName: "card41"), #imageLiteral(resourceName: "card42"), #imageLiteral(resourceName: "card43"), #imageLiteral(resourceName: "card44"), #imageLiteral(resourceName: "card45"), #imageLiteral(resourceName: "card46"), #imageLiteral(resourceName: "card47"), #imageLiteral(resourceName: "card48"), #imageLiteral(resourceName: "card49"), #imageLiteral(resourceName: "card50"), #imageLiteral(resourceName: "card51")]
    var cardList: [UILabel] = []
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        cardList = [label1, label2, label3, label4, label5, label6, label7, label8, label9, label10, label11, label12,
                    label13, label14, label15, label16, label17, label18, label19, label20, label21, label22, label23, label24,
                    label25, label26, label27, label28, label29, label30, label31, label32, label33, label34, label35, label36,
                    label37, label38, label39, label40, label41, label42, label43, label44, label45, label46, label47, label48,
                    label49, label50, label51, label52]
        
        if setup {
            setup = false
            initGroups()
            nextGroup()
            
            startTime = Date().timeIntervalSinceReferenceDate
            timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector
                (nextGroup), userInfo: nil, repeats: true)
            
            picker.isHidden = true
            guessButton.isEnabled = false
            guessButton.isHidden = true
            congrats.isHidden = true
            for textLabel in cardList {
                textLabel.isHidden = true
            }
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: Private funcs
    
    @objc private func nextGroup() {
        currentGroup += 1
        
        if (currentGroup < groups.count) {
            firstImage.image = groups[currentGroup][0] == -1 ? nil : images[ groups[currentGroup][0] ]
            secondImage.image = groups[currentGroup][1] == -1 ? nil : images[ groups[currentGroup][1] ]
            thirdImage.image = groups[currentGroup][2] == -1 ? nil : images[ groups[currentGroup][2] ]
        } else {
            timer?.invalidate()
            beginTest()
        }
        
    }
    
    private func initGroups() {
        if spadesOn {
            cards += 0...12
        }
        if diamondsOn {
            cards += 13...25
        }
        if heartsOn {
            cards += 26...38
        }
        if clubsOn {
            cards += 39...51
        }
        
        shuffled = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: cards) as! [Int]
        shuffledCopy = shuffled
        
        while (shuffled.count != 0) {
            let first = shuffled.removeFirst()
            let second = shuffled.count == 0 ? -1 : shuffled.removeFirst()
            let third = shuffled.count == 0 ? -1 : shuffled.removeFirst()
            
            groups.append([first, second, third])
        }
    }
    
    private func beginTest()
    {
        firstImage.isHidden = true
        secondImage.isHidden = true
        thirdImage.isHidden = true
        
        picker.isHidden = false
        guessButton.isHidden = false
        guessButton.isEnabled = true
    }
    
    // MARK: Picker things
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component == 0 ? 13 : 4
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return component == 0 ? cardStrings[row] : cardSuits[row]
    }
    
    // MARK: Action
    
    @IBAction func guess() {
        guessNumber += 1
        
        self.cardList[guessNumber].text = self.pickerView(self.picker, titleForRow: self.picker.selectedRow(inComponent: 0), forComponent: 0)! + self.pickerView(self.picker, titleForRow: self.picker.selectedRow(inComponent: 1), forComponent: 1)!
        
        self.cardList[guessNumber].isHidden = false
        
        let correctNum = shuffledCopy[guessNumber]
        var correct = cardStrings[correctNum % 13]
        
        correct += cardSuits[ guessNumber / 13 ]
        
        if (correct != self.cardList[guessNumber].text) {
            self.cardList[guessNumber].textColor = UIColor.red
            self.cardList[guessNumber].text = correct
            guessButton.isEnabled = false
            guessButton.isHidden = true
            picker.isHidden = true
            congrats.text = "Better luck next time!"
            congrats.isHidden = false
        } else if (guessNumber == cards.count - 1) {
            guessButton.isEnabled = false
            picker.isHidden = true
            guessButton.isHidden = true
            congrats.isHidden = false
        }

    }
    
    // MARK: Label cancer
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label9: UILabel!
    @IBOutlet weak var label10: UILabel!
    @IBOutlet weak var label11: UILabel!
    @IBOutlet weak var label12: UILabel!
    @IBOutlet weak var label13: UILabel!
    @IBOutlet weak var label14: UILabel!
    @IBOutlet weak var label15: UILabel!
    @IBOutlet weak var label16: UILabel!
    @IBOutlet weak var label17: UILabel!
    @IBOutlet weak var label18: UILabel!
    @IBOutlet weak var label19: UILabel!
    @IBOutlet weak var label20: UILabel!
    @IBOutlet weak var label21: UILabel!
    @IBOutlet weak var label22: UILabel!
    @IBOutlet weak var label23: UILabel!
    @IBOutlet weak var label24: UILabel!
    @IBOutlet weak var label25: UILabel!
    @IBOutlet weak var label26: UILabel!
    @IBOutlet weak var label27: UILabel!
    @IBOutlet weak var label28: UILabel!
    @IBOutlet weak var label29: UILabel!
    @IBOutlet weak var label30: UILabel!
    @IBOutlet weak var label31: UILabel!
    @IBOutlet weak var label32: UILabel!
    @IBOutlet weak var label33: UILabel!
    @IBOutlet weak var label34: UILabel!
    @IBOutlet weak var label35: UILabel!
    @IBOutlet weak var label36: UILabel!
    @IBOutlet weak var label37: UILabel!
    @IBOutlet weak var label38: UILabel!
    @IBOutlet weak var label39: UILabel!
    @IBOutlet weak var label40: UILabel!
    @IBOutlet weak var label41: UILabel!
    @IBOutlet weak var label42: UILabel!
    @IBOutlet weak var label43: UILabel!
    @IBOutlet weak var label44: UILabel!
    @IBOutlet weak var label45: UILabel!
    @IBOutlet weak var label46: UILabel!
    @IBOutlet weak var label47: UILabel!
    @IBOutlet weak var label48: UILabel!
    @IBOutlet weak var label49: UILabel!
    @IBOutlet weak var label50: UILabel!
    @IBOutlet weak var label51: UILabel!
    @IBOutlet weak var label52: UILabel!

}















