//
//  Utils.swift
//  IntellimentAssignment
//
//  Created by Durgesh Pandey on 09/01/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import Foundation

// Get Weather Icon from string
func getWeatherIcon(_ weatherIconStr: String) -> String {
    
    switch weatherIconStr {
    case "01d":
        return "weather-clear"
    case "02d", "03d":
        return "weather-few"
    case "04d", "04n":
        return "weather-broken"
    case "09d", "09n":
        return "weather-shower"
    case "10d":
        return "weather-rain"
    case "11d", "11n":
        return "weather-tstorm"
    case "13d", "13n":
        return "weather-snow"
    case "50d", "50n":
        return "weather-mist"
    case "01n":
        return "weather-moon"
    case "02n", "03n":
        return "weather-few-night"
    case "10n":
        return "weather-rain-night"
    default:
        return "weather-clear"
    }
}

//get time to display in hourly forecast
func getTimeStringFromDateString(_ dateString: String) -> String {
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let formattedDate = dateFormatter.date(from:dateString)!
    dateFormatter.dateFormat = "EEEE hh a"
    let timeString = dateFormatter.string(from: formattedDate)
    return timeString
}
