//
//  MealTableViewCell.swift
//  FoodTracker
//
//  Created by Shashank Gupta on 05/03/16.
//  Copyright © 2016 Shashank Gupta. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    //MARK:Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
