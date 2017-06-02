//
//  EncodingTestViewController.swift
//  mnemosyne
//
//  Created by Bhavin Gupta on 5/31/17.
//  Copyright © 2017 bhavingpt. All rights reserved.
//

import UIKit
import GameKit

class EncodingTestViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var thirdImage: UIImageView!
    
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
    
    var setup: Bool = true
    var cards = [Int]()
    var groups: [[Int]] = []
    let images = [#imageLiteral(resourceName: "card0"), #imageLiteral(resourceName: "card1"), #imageLiteral(resourceName: "card2"), #imageLiteral(resourceName: "card3"), #imageLiteral(resourceName: "card4"), #imageLiteral(resourceName: "card5"), #imageLiteral(resourceName: "card6"), #imageLiteral(resourceName: "card7"), #imageLiteral(resourceName: "card8"), #imageLiteral(resourceName: "card9"), #imageLiteral(resourceName: "card10"), #imageLiteral(resourceName: "card11"), #imageLiteral(resourceName: "card12"),
                  #imageLiteral(resourceName: "card13"), #imageLiteral(resourceName: "card14"), #imageLiteral(resourceName: "card15"), #imageLiteral(resourceName: "card16"), #imageLiteral(resourceName: "card17"), #imageLiteral(resourceName: "card18"), #imageLiteral(resourceName: "card19"), #imageLiteral(resourceName: "card20"), #imageLiteral(resourceName: "card21"), #imageLiteral(resourceName: "card22"), #imageLiteral(resourceName: "card23"), #imageLiteral(resourceName: "card24"), #imageLiteral(resourceName: "card25"),
                  #imageLiteral(resourceName: "card26"), #imageLiteral(resourceName: "card27"), #imageLiteral(resourceName: "card28"), #imageLiteral(resourceName: "card29"), #imageLiteral(resourceName: "card30"), #imageLiteral(resourceName: "card31"), #imageLiteral(resourceName: "card32"), #imageLiteral(resourceName: "card33"), #imageLiteral(resourceName: "card34"), #imageLiteral(resourceName: "card35"), #imageLiteral(resourceName: "card36"), #imageLiteral(resourceName: "card37"), #imageLiteral(resourceName: "card38"),
                  #imageLiteral(resourceName: "card39"), #imageLiteral(resourceName: "card40"), #imageLiteral(resourceName: "card41"), #imageLiteral(resourceName: "card42"), #imageLiteral(resourceName: "card43"), #imageLiteral(resourceName: "card44"), #imageLiteral(resourceName: "card45"), #imageLiteral(resourceName: "card46"), #imageLiteral(resourceName: "card47"), #imageLiteral(resourceName: "card48"), #imageLiteral(resourceName: "card49"), #imageLiteral(resourceName: "card50"), #imageLiteral(resourceName: "card51")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if setup {
            setup = false
            initGroups()
            nextGroup()
            
            startTime = Date().timeIntervalSinceReferenceDate
            timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector
                (nextGroup), userInfo: nil, repeats: true)
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
        
        cards = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: cards) as! [Int]
        
        while (cards.count != 0) {
            let third = cards.removeLast()
            let second = cards.count == 0 ? -1 : cards.removeLast()
            let first = cards.count == 0 ? -1 : cards.removeLast()
            
            groups.append([first, second, third])
        }
    }
    
    private func beginTest() {
        firstImage.isHidden = true
        secondImage.isHidden = true
        thirdImage.isHidden = true
    }

}
