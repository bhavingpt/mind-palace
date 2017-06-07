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
    
    @IBOutlet var randomButtons: [UIButton]!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadMappings()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var i = 0
        for button in randomButtons {
            button.tag = i
            i += 1
        }
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
    
    
    // MARK: Actions
    
    @IBAction func randomize(_ sender: UIButton) {
        let num = sender.tag
        
        var chosen = ""
        var tries = 100
        while (chosen == "" || mappings.contains(chosen)) {
            if (tries == 0) {
                chosen = defaultString
                break
            }
            tries -= 1
            let randomIndex = Int(arc4random_uniform(UInt32(people.count)))
            chosen = people[randomIndex]
        }
        mappings[num * 3] = chosen
        
        chosen = ""
        tries = 100
        while (chosen == "" || mappings.contains(chosen)) {
            if (tries == 0) {
                chosen = defaultString
                break
            }
            tries -= 1
            let randomIndex = Int(arc4random_uniform(UInt32(actions.count)))
            chosen = actions[randomIndex]
        }
        mappings[num * 3 + 1] = chosen
        
        chosen = ""
        tries = 100
        while (chosen == "" || mappings.contains(chosen)) {
            if (tries == 0) {
                chosen = defaultString
                break
            }
            tries -= 1
            let randomIndex = Int(arc4random_uniform(UInt32(objects.count)))
            chosen = objects[randomIndex]
        }
        mappings [num * 3 + 2] = chosen
        
        displayMappings()
        storeMappings()
        
    }
    
    // MARK: Databases
    
    let people = ["Marilyn Monroe",
                  "Abraham Lincoln",
                  "Mother Teresa",
                  "John F. Kennedy",
                  "Martin Luther King",
                  "Nelson Mandela",
                  "Winston Churchill",
                  "Bill Gates",
                  "Muhammad Ali",
                  "Mahatma Gandhi",
                  "Christopher Columbus",
                  "George Orwell",
                  "Elvis Presley",
                  "Albert Einstein",
                  "Paul McCartney",
                  "Queen Elizabeth",
                  "Leonardo da Vinci",
                  "Louis Pasteur",
                  "Pablo Picasso",
                  "Franklin Roosevelt",
                  "Donald Trump",
                  "Thomas Edison",
                  "Ludwig Beethoven",
                  "Oprah Winfrey",
                  "Kevin Spacey",
                  "Stephen Colbert",
                  "Dalai Lama",
                  "Walt Disney",
                  "Neil Armstrong",
                  "Barack Obama",
                  "Malcolm X",
                  "J.K.Rowling",
                  "Pele",
                  "Angelina Jolie",
                  "Ernest Hemingway",
                  "John Lennon",
                  "Henry Ford",
                  "Michael Jordan",
                  "George Bush",
                  "Pope Francis",
                  "Amelia Earhart",
                  "Eminem",
                  "Alfred Hitchcock",
                  "Michael Jackson",
                  "Madonna",
                  "Mata Hari",
                  "Cleopatra",
                  "Steve Jobs",
                  "Ronald Reagan",
                  "Lionel Messi",
                  "Babe Ruth",
                  "Roger Federer",
                  "Audrey Hepburn",
                  "David Beckham",
                  "Tiger Woods",
                  "Usain Bolt",
                  "Tom Cruise",
                  "Christiano Ronaldo",
                  "Marie Curie",
                  "Stephen Hawking",
                  "Lance Armstrong",
                  "Shakira",
                  "Jon Stewart",
                  "The Wright Brothers",
                  "Al Gore",
                  "George Clooney",
                  "Brad Pitt"]
    
    let actions = [ "coloring",
                    "carving up",
                    "watering",
                    "brushing next to",
                    "humming next to",
                    "yelling at",
                    "hugging",
                    "kicking",
                    "stealing",
                    "sleeping next to",
                    "counting cards with",
                    "sunbathing with",
                    "photographing",
                    "painting",
                    "measuring",
                    "drinking from",
                    "licking",
                    "wearing",
                    "jumping over",
                    "throwing dice at",
                    "toasting",
                    "clapping for",
                    "on the phone with",
                    "spitting on",
                    "cooking",
                    "pickpocketing",
                    "gambling with",
                    "giving a speech to",
                    "sitting on",
                    "juggling",
                    "vaccinating",
                    "rubbing",
                    "smelling",
                    "shooting",
                    "singing about a",
                    "shivering next to",
                    "counting money with",
                    "punching",
                    "kissing",
                    "memorizing",
                    "touring",
                    "navigating",
                    "escaping",
                    "murdering",
                    "observing",
                    "inventing",
                    "buying",
                    "making",
                    "driving",
                    "eating",
                    "breaking",
                    "whistling at",
                    "kneeling before",
                    "biting",
                    "repairing"]
    
    let objects = ["a tuxedo",
                   "a doghouse",
                   "a hammer",
                   "a pirate ship",
                   "a bird",
                   "a diamond",
                   "a can of soup",
                   "their pet fish",
                   "a pen",
                   "a notebook",
                   "ice cream",
                   "a beanstalk",
                   "lasagna",
                   "a sheep",
                   "a tricycle",
                   "a tree",
                   "a stapler",
                   "a horseshoe",
                   "a dragon",
                   "blue socks",
                   "a Sharpie",
                   "a Frisbee",
                   "a boxcar train",
                   "an Olympic diver",
                   "a Ferrari",
                   "a donkey",
                   "a wave pool",
                   "the Mona Lisa",
                   "the White House",
                   "the Eiffel Tower",
                   "a pizza",
                   "a gold crown",
                   "a plastic bag",
                   "a red tie",
                   "a laptop",
                   "a jacuzzi",
                   "a yacht",
                   "a parrot",
                   "a unicorn",
                   "Pacman",
                   "the United Nations",
                   "a shovel",
                   "the beach",
                   "a baby",
                   "a tennis ball",
                   "a skateboard",
                   "a stethoscope",
                   "a telescope",
                   "orange juice",
                   "a fishing rod",
                   "a red brick",
                   "a flip flop",
                   "chewing gum",
                   "a snowball"]
    
    

    
    
    
    
    
    
    

}
