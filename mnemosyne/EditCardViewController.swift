//
//  EditCardViewController.swift
//  mnemosyne
//
//  Created by Bhavin Gupta on 5/27/17.
//  Copyright © 2017 bhavingpt. All rights reserved.
//

import UIKit
import os.log

class EditCardViewController: UIViewController {
    
    // MARK: Properties
    
    var card: Card?
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var personTextField: UITextField!
    @IBOutlet weak var actionTextField: UITextField!
    @IBOutlet weak var objectTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button wasn't pressed, canceling", log: OSLog.default, type: .debug)
            return
        }
        
        os_log("I got your save, will handle in a while", log: OSLog.default, type: .debug)
        
        // TODO pass along the information to the controller
    }

}
