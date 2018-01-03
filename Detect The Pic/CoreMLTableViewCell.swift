//
//  CoreMLTableViewCell.swift
//  Detect The Pic
//
//  Created by Mariano Echegoyen on 1/2/18.
//  Copyright © 2018 Mariano Echegoyen. All rights reserved.
//

import UIKit

class CoreMLTableViewCell: UITableViewCell {
    
    @IBOutlet weak var theSmallLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
