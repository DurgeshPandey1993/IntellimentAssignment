//
//  WeatherDetailModel.swift
//  IntellimentAssignment
//
//  Created by Durgesh Pandey on 08/01/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import Foundation
import ObjectMapper

struct WeatherDetailModel: Mappable {
    
    var city: WeatherDetailCityModel?
    var cod: String?
    var message: Double?
    var cnt: Int?
    var list: [WeatherDetailListModel]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        city       <- map["city"]
        cod       <- map["cod"]
        message       <- map["message"]
        cnt       <- map["cnt"]
        list       <- map["list"]
    }
}

struct WeatherDetailListModel: Mappable {
    
    var dt: Double?
    var main: WeatherDetailMainModel?
    var weather: [WeatherDetailWeatherModel]?
    var clouds: WeatherDetailCloudModel?
    var wind: WeatherDetailWindModel?
    var sys: WeatherDetailSysModel?
    var dt_txt: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        dt       <- map["dt"]
        main       <- map["main"]
        weather       <- map["weather"]
        clouds       <- map["clouds"]
        weather       <- map["weather"]
        wind       <- map["wind"]
        sys       <- map["sys"]
        clouds       <- map["clouds"]
        dt_txt       <- map["dt_txt"]
    }
}

struct WeatherDetailSysModel: Mappable {
    
    var type: Double?
    var id: Double?
    var message: Double?
    var country: String?
    var sunrise: Double?
    var sunset: Double?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        type       <- map["type"]
        id       <- map["id"]
        message       <- map["message"]
        country       <- map["country"]
        sunrise       <- map["sunrise"]
        sunset       <- map["sunset"]
    }
}

struct WeatherDetailWeatherModel: Mappable {
    
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        id       <- map["id"]
        main       <- map["main"]
        description       <- map["description"]
        icon       <- map["icon"]
    }
}

struct WeatherDetailMainModel: Mappable {
    
    var temp: Double?
    var pressure: Double?
    var humidity: Double?
    var temp_min: Double?
    var temp_max: Double?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        temp       <- map["temp"]
        pressure       <- map["pressure"]
        humidity       <- map["humidity"]
        temp_min       <- map["temp_min"]
        temp_max       <- map["temp_max"]
    }
}

struct WeatherDetailWindModel: Mappable {
    
    var speed: Double?
    var deg: Double?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        speed       <- map["speed"]
        deg       <- map["deg"]
    }
}

struct WeatherDetailCloudModel: Mappable {
    
    var all: Double?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        all       <- map["all"]
    }
}


struct WeatherDetailCityModel: Mappable {
    
    var id: Int?
    var name: String?
    var coord: WeatherDetailCityCoordModel?
    var country: String?
    var population: Int?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        id       <- map["id"]
        name       <- map["name"]
        coord       <- map["coord"]
        country       <- map["country"]
        population       <- map["population"]
    }
}

struct WeatherDetailCityCoordModel: Mappable {
    
    var lon: Double?
    var lat: Double?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        lon       <- map["lon"]
        lat       <- map["lat"]
    }
}
