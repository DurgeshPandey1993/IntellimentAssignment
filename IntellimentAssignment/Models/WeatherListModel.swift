//
//  WeatherListModel.swift
//  IntellimentAssignment
//
//  Created by Durgesh Pandey on 08/01/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import Foundation
import ObjectMapper

struct WeatherListResultModel: Mappable {
    
    var cnt: Int?
    var list: [WeatherListModel]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        cnt       <- map["cnt"]
        list       <- map["list"]
    }
}

struct WeatherListModel: Mappable {
    
    var coord: WeatherListCoordModel?
    var sys: WeatherListSysModel?
    var weather: [WeatherListWeatherModel]?
    var main: WeatherListMainModel?
    var visibility: Double?
    var wind: WeatherListWindModel?
    var clouds: WeatherListCloudModel?
    var dt: Double?
    var id: Double?
    var name: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        coord       <- map["coord"]
        sys       <- map["sys"]
        weather       <- map["weather"]
        main       <- map["main"]
        visibility       <- map["visibility"]
        wind       <- map["wind"]
        clouds       <- map["clouds"]
        dt       <- map["dt"]
        id       <- map["id"]
        name       <- map["name"]
    }
}

struct WeatherListCoordModel: Mappable {
    
    var lon: Double?
    var lat: Double?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        lon       <- map["lon"]
        lat       <- map["lat"]
    }
}

struct WeatherListSysModel: Mappable {
    
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

struct WeatherListWeatherModel: Mappable {
    
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

struct WeatherListMainModel: Mappable {
    
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

struct WeatherListWindModel: Mappable {
    
    var speed: Double?
    var deg: Double?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        speed       <- map["speed"]
        deg       <- map["deg"]
    }
}

struct WeatherListCloudModel: Mappable {
    
    var all: Double?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        all       <- map["all"]
    }
}
