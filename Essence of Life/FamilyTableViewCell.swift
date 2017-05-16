//
//  FamilyTableViewCell.swift
//  Essence of Life
//
//  Created by HChlebek on 5/15/17.
//  Copyright © 2017 Les Lentilz. All rights reserved.
//

import UIKit

class FamilyTableViewCell: UITableViewCell
{
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var relationshipLabel: UILabel!
    @IBOutlet weak var sideLabel: UILabel!
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }

}
