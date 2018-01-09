//
//  WeatherDetailInteractor.swift
//  IntellimentAssignment
//
//  Created by Durgesh Pandey on 08/01/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import Foundation

class WeatherDetailInteractor: WeatherDetailUseCase {
    
    var output: WeatherDetailInteractorOutput!
    
    func fetchWeatherDetailData(_ cityId: String) {
        
        //Fetch Weather Detail Data
        WeatherDetailApiService.fetchWeatherDetailData(cityId) { (weatherDetail, isError, errorString) in
            
            //Check for Error
            if !isError {
                
                //No Error
                if let weatherDetail = weatherDetail{
                    
                    //List fetched successfully
                    self.output.weatherDetailDataFetchedSuccessfully(weatherDetail)
                } else {
                    
                    //No data Received or data could not be parsed
                    self.output.weatherDetailDataFetchFailed()
                }
            } else {
                
                //Error
                self.output.weatherDetailDataFetchFailed()
            }
        }
        
    }
}

