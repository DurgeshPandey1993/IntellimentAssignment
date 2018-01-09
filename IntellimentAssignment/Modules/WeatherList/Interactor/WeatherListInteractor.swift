//
//  WeatherListInteractor.swift
//  IntellimentAssignment
//
//  Created by Durgesh Pandey on 08/01/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import Foundation

class WeatherListInteractor: WeatherListUseCase {
    
    var output: WeatherListInteractorOutput!
    
    func fetchWeatherData(_ cityIds: String) {
        
        //Fetch Weather Data
        WeatherListApiService.fetchWeatherData(cityIds) { (weatherList, isError, errorString) in
            
           //Check for Error
            if !isError {
                
                //No Error
                if let weatherListArr = weatherList?.list {
                    
                    //List fetched successfully
                    self.output.weatherDataFetchedSuccessfully(weatherListArr)
                } else {
                    
                    //No data Received or data could not be parsed
                    self.output.weatherDataFetchFailed()
                }
            } else {
                
                //Error
               self.output.weatherDataFetchFailed()
            }
        }
    }
}
