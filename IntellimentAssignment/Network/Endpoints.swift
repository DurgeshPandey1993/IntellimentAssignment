//
//  Endpoints.swift
//  IntellimentAssignment
//
//  Created by Durgesh Pandey on 08/01/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import Foundation

struct API {
    
    //Weather List
    static let weatherListBaseUrl = "https://api.openweathermap.org/data/2.5/group?id="
    static let weatherListAPIKeyPath = "&units=metric&APPID="
    static let weatherListAPIKey = "33a37ee298c9c8e31fa6b993cd816742"
    
    //Hourly Forecast
    static let weatherDetailBaseUrl = "https://api.openweathermap.org/data/2.5/forecast?id="
    static let weatherDetailAPIKeyPath = "&appid="
    static let weatherDetailAPIKey = "325acc51cfaa6a4706907f8730e2ff7a"
}
