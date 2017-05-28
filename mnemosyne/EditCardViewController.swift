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
    
    var currentCard: Int = -1
    
    var first_text: String?
    var second_text: String?
    var third_text: String?
    var save_data: Bool = false
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var personTextField: UITextField!
    @IBOutlet weak var actionTextField: UITextField!
    @IBOutlet weak var objectTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        if (first_text != nil) {
            self.personTextField.text = first_text
        }
        if (second_text != nil) {
            self.actionTextField.text = second_text
        }
        if (third_text != nil) {
            self.objectTextField.text = third_text
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("Save wasn't pressed", log: OSLog.default, type: .debug)
            return
        }
        
        self.save_data = true
        self.first_text = personTextField.text
        self.second_text = actionTextField.text
        self.third_text = objectTextField.text
    }

}
