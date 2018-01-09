//
//  WeatherDetailForecastTableViewCell.swift
//  IntellimentAssignment
//
//  Created by Durgesh Pandey on 09/01/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import UIKit

class WeatherDetailForecastTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewWeatherIcon: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
