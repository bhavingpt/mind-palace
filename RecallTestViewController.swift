//
//  RecallTestViewController.swift
//  mnemosyne
//
//  Created by Bhavin Gupta on 5/29/17.
//  Copyright © 2017 bhavingpt. All rights reserved.
//

import UIKit

class RecallTestViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    var mapping = [String]()
    
    // MARK: Passed Properties
    
    var spadesOn = false
    var clubsOn = false
    var diamondsOn = false
    var heartsOn = false
    
    // MARK: Properties
    
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var card: UIImageView!
    @IBOutlet weak var choiceA: UIButton!
    @IBOutlet weak var choiceB: UIButton!
    @IBOutlet weak var choiceC: UIButton!
    @IBOutlet weak var choiceD: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapping = (defaults.object(forKey: "pao") as? [String])!
        
        // TODO handle the Quit button and unwindToRecallScreenWithSender(_:)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    
    @IBAction func selection(_ sender: UIButton) {
        print ("your selection has not been recorded")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
