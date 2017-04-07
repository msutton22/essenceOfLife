//
//  PasswordTableViewCell.swift
//  Essence of Life
//
//  Created by HChlebek on 4/7/17.
//  Copyright © 2017 Les Lentilz. All rights reserved.
//

import UIKit

class PasswordTableViewCell: UITableViewCell
{

    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
