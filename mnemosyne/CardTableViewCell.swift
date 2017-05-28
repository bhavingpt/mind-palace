//
//  CardTableViewCell.swift
//  mnemosyne
//
//  Created by Bhavin Gupta on 5/27/17.
//  Copyright © 2017 bhavingpt. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var pao: UILabel!
    @IBOutlet weak var pic: UIImageView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
