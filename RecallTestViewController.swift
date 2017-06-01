//
//  RecallTestViewController.swift
//  mnemosyne
//
//  Created by Bhavin Gupta on 5/29/17.
//  Copyright © 2017 bhavingpt. All rights reserved.
//

import UIKit
import GameKit

class RecallTestViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    var mapping = [String]()
    var cleanMapping = [String]()
    var test = [Int]()
    var results = [Bool]()
    
    var question: Int = 0
    
    // MARK: Passed Properties
    
    var spadesOn = false
    var clubsOn = false
    var diamondsOn = false
    var heartsOn = false
    
    // MARK: Properties
    
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var choiceA: UIButton!
    @IBOutlet weak var choiceB: UIButton!
    @IBOutlet weak var choiceC: UIButton!
    @IBOutlet weak var choiceD: UIButton!
    @IBOutlet weak var stopwatch: UILabel!
    
    // MARK: Timer
    
    weak var timer: Timer?
    var startTime: Double = 0
    var elapsed: Double = 0
    var time: Double = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if test.count == 0 {
            self.mapping = (defaults.object(forKey: "pao") as? [String])!
            
            for i in 0...51 {
                self.cleanMapping.append(self.mapping[i*3]+" "+self.mapping[i*3+1]+" "+self.mapping[i*3+2])
            }
            
            setupTest()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    
    @IBAction func selection(_ sender: UIButton) {
        results.append(sender.currentTitle! == cleanMapping[question - 1])
        if results.last! {
            self.view.backgroundColor = UIColor.green
            print("LOL")
        } else {
            self.view.backgroundColor = UIColor.red
            print( "HM")
        }
        
        self.view.setNeedsDisplay()
            
        usleep(50000)
        
        self.view.backgroundColor = UIColor.white
        self.view.setNeedsDisplay()
        nextQuestion()
    }
    
    // MARK: Private funcs for backend
    
    private func setupTest() {
        if spadesOn {
            test += 0...12
        }
        if diamondsOn {
            test += 13...25
        }
        if heartsOn {
            test += 26...38
        }
        if clubsOn {
            test += 39...51
        }
        test = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: test) as! [Int]
        
        startTime = Date().timeIntervalSinceReferenceDate
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        nextQuestion()
    }
    
    private func nextQuestion() {
        if (question == test.count) {
            endTest()
        } else {
            choiceA.setTitle("", for: .normal)
            choiceB.setTitle("", for: .normal)
            choiceC.setTitle("", for: .normal)
            choiceD.setTitle("", for: .normal)
            
            question += 1
            number.text = String(question)
            
            let card = test[question - 1]
            var fake1 = -1
            var fake2 = -1
            var fake3 = -1
            
            while (fake1 < 0 || fake1 == card || !isTested(cardNum: fake1)) {
                fake1 = Int(arc4random_uniform(52))
            }
            while (fake2 < 0 || fake2 == card || fake2 == fake1 || !isTested(cardNum: fake2)) {
                fake2 = Int(arc4random_uniform(52))
            }
            while (fake3 < 0 || fake3 == card || fake3 == fake1 || fake3 == fake2 || !isTested(cardNum: fake3)) {
                fake3 = Int(arc4random_uniform(52))
            }
            
            var mult = [card, fake1, fake2, fake3]
            mult = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: mult) as! [Int]
            
            choiceA.setTitle(cleanMapping[mult[0]], for: .normal)
            choiceB.setTitle(cleanMapping[mult[1]], for: .normal)
            choiceC.setTitle(cleanMapping[mult[2]], for: .normal)
            choiceD.setTitle(cleanMapping[mult[3]], for: .normal)
            
            // TODO handle the image
            
        }
    }
    
    private func endTest() {
        elapsed = Date().timeIntervalSinceReferenceDate - startTime
        timer?.invalidate()
        
        // TODO display the number correct
        
        choiceA.isHidden = true
        choiceB.isHidden = true
        choiceC.isHidden = true
        choiceD.isHidden = true
        image.isHidden = true
        number.isHidden = true
        stopwatch.textColor = UIColor.green
    }
    
    private func isTested(cardNum: Int) -> Bool {
        if (cardNum < 13) {
            return spadesOn
        } else if (cardNum < 26) {
            return diamondsOn
        } else if (cardNum < 39) {
            return heartsOn
        } else {
            return clubsOn
        }
    }
    
    @objc private func updateCounter() {
        time = Date().timeIntervalSinceReferenceDate - startTime
        
        let minutes = UInt8(time / 60.0)
        time -= (TimeInterval(minutes) * 60)
        
        let seconds = UInt8(time)
        
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        
        stopwatch.text = strMinutes + ":" + strSeconds
    }

}
