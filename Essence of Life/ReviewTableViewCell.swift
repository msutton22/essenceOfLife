//
//  ReviewTableViewCell.swift
//  Essence of Life
//
//  Created by Maddy Sutton on 4/6/17.
//  Copyright © 2017 Les Lentilz. All rights reserved.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {
    @IBOutlet weak var stars: StarControl!
    @IBOutlet weak var labelReview: UILabel!
    @IBOutlet weak var imageReview: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
