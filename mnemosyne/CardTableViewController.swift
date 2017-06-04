//
//  CardTableViewController.swift
//  mnemosyne
//
//  Created by Bhavin Gupta on 5/27/17.
//  Copyright © 2017 bhavingpt. All rights reserved.
//

import UIKit

class CardTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var defaultString: String = "-------"
    
    let defaults = UserDefaults.standard
    
    var mappings: [String] = [] {
        didSet {
            displayMappings()
            storeMappings()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadMappings()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 13
    }
    
    // MARK: Navigation
    
    @IBAction func unwindToCardList(sender: UIStoryboardSegue) {

        guard let sourceView = sender.source as? EditCardViewController else {
            fatalError("receieved unwind segue from unknown controller.")
        }
        
        if (sourceView.save_data) {
            let pass_1 = (sourceView.first_text == "") ? defaultString : sourceView.first_text
            let pass_2 = (sourceView.second_text == "") ? defaultString : sourceView.second_text
            let pass_3 = (sourceView.third_text == "") ? defaultString : sourceView.third_text
            
            self.mappings[sourceView.currentCard * 3] = pass_1!
            self.mappings[sourceView.currentCard * 3 + 1] = pass_2!
            self.mappings[sourceView.currentCard * 3 + 2] = pass_3!
        }
    }

    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let nav = segue.destination as? UINavigationController {
            if let dest = nav.viewControllers[0] as? EditCardViewController {
                let cardNum = Int(segue.identifier!)
                dest.currentCard = cardNum!
                
                print(dest.currentCard)
                
                let current_first = mappings[cardNum! * 3]
                let current_second = mappings[cardNum! * 3 + 1]
                let current_third = mappings[cardNum! * 3 + 2]
                
                if (current_first != defaultString) {
                    dest.first_text = current_first
                }
                if (current_second != defaultString) {
                    dest.second_text = current_second
                }
                if (current_third != defaultString) {
                    dest.third_text = current_third
                }
                
                dest.mappings = self.mappings
            }
        }
    }
    
    
    // MARK: Private funcs
    
    private func loadMappings() {
        mappings = defaults.object(forKey: "pao") as? [String] ?? Array(repeating: defaultString, count: 156)
    }
    
    private func storeMappings() {
        defaults.set(self.mappings, forKey: "pao")
    }
    
    private func displayMappings() {
        var current: CardTableViewCell
        for index in 0...51 {
            current = paos[index]
            let first = mappings[index * 3]
            let second = mappings[index * 3 + 1]
            let third = mappings[index * 3 + 2]
            current.pao.text = first + " | " + second + " | " + third
        }
        self.tableView.reloadData()
    }
    
    // MARK: PAO Pairings
   
    @IBOutlet var paos: [CardTableViewCell]!
    
    
    
    
    
    
    

}
