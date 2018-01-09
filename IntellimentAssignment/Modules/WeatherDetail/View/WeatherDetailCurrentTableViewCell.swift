//
//  WeatherDetailCurrentTableViewCell.swift
//  IntellimentAssignment
//
//  Created by Durgesh Pandey on 09/01/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import UIKit

class WeatherDetailCurrentTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTempMaxMin: UILabel!
    @IBOutlet weak var labelCurrentTemp: UILabel!
    @IBOutlet weak var labelCondition: UILabel!
    @IBOutlet weak var imageViewWeatherIcon: UIImageView!
    @IBOutlet weak var labelCityName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
