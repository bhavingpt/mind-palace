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
    
    var mappings = Array(repeating: "-", count: 468)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mappings = loadMappings()
        displayMappings()
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

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "CardTableViewCell", for: indexPath) as? CardTableViewCell else {
            fatalError("The dequeued cell was not of type CardTableViewCell.")
        }

        cell.pic.image = #imageLiteral(resourceName: "default")
        cell.pao.text = "--- | --- | ---"
        
        return cell
    }*/
    
    
    // MARK: - Navigation
    
    @IBAction func unwindToCardList(sender: UIStoryboardSegue) {
        // TODO check if sender is save or cancel!!
        // TODO update mappings
        displayMappings()
        storeMappings()
    }

    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: Private funcs
    
    private func loadMappings() -> [String] {
        // TODO load the data
        return Array(repeating: "---", count: 36)
    }
    
    private func storeMappings() {
        // TODO store the data
    }
    
    private func displayMappings() {
        var current: CardTableViewCell
        for index in 0...51 {
            current = paos[index]
            current.pao.text = "hell no \(index)"
        }
    }
    
    // MARK: PAO Pairings
   
    @IBOutlet var paos: [CardTableViewCell]!
    
    
    
    
    
    
    

}
