//
//  HomeViewController.swift
//  mnemosyne
//
//  Created by Bhavin Gupta on 5/27/17.
//  Copyright © 2017 bhavingpt. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var tutorialDone = false
    let defaults = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.tintColor = UIColor.white
        tutorialDone = defaults.object(forKey: "tutorial") as? Bool ?? false
        
        if (!tutorialDone) {
            startTutorial()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToHome(sender: UIStoryboardSegue) {
        
    }
    
    private func startTutorial() {
        tutorialDone = true
        defaults.set(self.tutorialDone, forKey: "tutorial")
        performSegue(withIdentifier: "beginTutorial", sender: (Any).self)
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
