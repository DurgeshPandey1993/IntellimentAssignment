//
//  WeatherListTableViewCell.swift
//  IntellimentAssignment
//
//  Created by Durgesh Pandey on 08/01/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import UIKit

class WeatherListTableViewCell: UITableViewCell {

    @IBOutlet weak var labelCityName: UILabel!
    @IBOutlet weak var labelCurrenttemp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
