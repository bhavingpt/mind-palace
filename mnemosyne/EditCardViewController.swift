//
//  EditCardViewController.swift
//  mnemosyne
//
//  Created by Bhavin Gupta on 5/27/17.
//  Copyright © 2017 bhavingpt. All rights reserved.
//

import UIKit
import GameKit
import os.log

class EditCardViewController: UIViewController {
    
    // MARK: Properties
    
    var currentCard: Int = -1
    
    var first_text: String?
    var second_text: String?
    var third_text: String?
    var save_data: Bool = false
    var mappings: [String] = []
    
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
    
    // MARK: Randomization
    
    @IBAction func randomizePerson(_ sender: UIButton) {
        var chosen = ""
        while (chosen == "" || mappings.contains(chosen)) {
            let randomIndex = Int(arc4random_uniform(UInt32(people.count)))
            chosen = people[randomIndex]
        }
        personTextField.text = chosen
    }
    
    @IBAction func randomizeAction(_ sender: UIButton) {
        var chosen = ""
        while (chosen == "" || mappings.contains(chosen)) {
            let randomIndex = Int(arc4random_uniform(UInt32(actions.count)))
            chosen = actions[randomIndex]
        }
        actionTextField.text = chosen
    }
    
    @IBAction func randomizeObject(_ sender: UIButton) {
        var chosen = ""
        while (chosen == "" || mappings.contains(chosen)) {
            let randomIndex = Int(arc4random_uniform(UInt32(objects.count)))
            chosen = objects[randomIndex]
        }
        objectTextField.text = chosen
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
                    "kneeling before"]
    
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
                   "a fishing rod"]
                    
                    

}






