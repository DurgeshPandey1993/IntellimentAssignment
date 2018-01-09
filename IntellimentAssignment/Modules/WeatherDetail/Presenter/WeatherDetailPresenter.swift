//
//  WeatherDetailPresenter.swift
//  IntellimentAssignment
//
//  Created by Durgesh Pandey on 08/01/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import Foundation

class WeatherDetailPresenter: WeatherDetailPresentation {
    
    var view: WeatherDetailView?
    var interactor: WeatherDetailUseCase!
    var router: WeatherDetailWireframe!
    
    var weatherDetailData: WeatherDetailModel?
    
    func viewDidLoad() {
        
    }
    
    func fetchWeatherDetailData(_ cityId: String) {
        
        view?.showActivityIndicator()
        interactor.fetchWeatherDetailData(cityId)
    }
}

extension WeatherDetailPresenter: WeatherDetailInteractorOutput {
    
    func weatherDetailDataFetchedSuccessfully(_ weatherDetailModel: WeatherDetailModel) {
        
        self.weatherDetailData = weatherDetailModel
        
        view?.hideActivityIndicator()
        
        if let weatherDetailDataModel = self.weatherDetailData {
            view?.showWeatherDetail(weatherDetailDataModel)
        }
    }
    
    func weatherDetailDataFetchFailed() {
        view?.hideActivityIndicator()
        view?.showNoContentScreen()
    }
}
