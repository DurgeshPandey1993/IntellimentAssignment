//
//  WeatherDetailAPIService.swift
//  IntellimentAssignment
//
//  Created by Durgesh Pandey on 09/01/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class WeatherDetailApiService {
    
    static func fetchWeatherDetailData(_ cityId: String, _ completionHandler: @escaping (_ weatherDetailResult: WeatherDetailModel?, _ isError: Bool, _ error: String?) -> ()) {
        
        let currentWeatherUrl = API.weatherDetailBaseUrl + cityId + API.weatherDetailAPIKeyPath + API.weatherDetailAPIKey
        
        Alamofire.request(currentWeatherUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .validate()
            .responseString(completionHandler: { (responseString) in
                print(responseString.value ?? "Could not get proper response")
            })
            .responseObject { (response: DataResponse<WeatherDetailModel>) in
                
                switch response.result {
                case .success(let weatherResult):
                    
                    //Response received successfully
                    completionHandler(weatherResult, false, nil)
                    break
                case .failure(let error):
                    
                    //There was an error
                    completionHandler(nil, true, error.localizedDescription)
                    break
                }
        }
    }
}
