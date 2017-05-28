//
//  Card.swift
//  mnemosyne
//
//  Created by Bhavin Gupta on 5/27/17.
//  Copyright © 2017 bhavingpt. All rights reserved.
//

import Foundation

class Card {
    // MARK: Properties
    
    var person: String?
    var action: String?
    var object: String?
    
    init(person: String?, action: String?, object: String?) {
        self.person = person
        self.action = action
        self.object = object
    }
}
