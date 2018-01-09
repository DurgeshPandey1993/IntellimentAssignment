//
//  WeatherListPresenter.swift
//  IntellimentAssignment
//
//  Created by Durgesh Pandey on 08/01/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import Foundation

class WeatherListPresenter: WeatherListPresentation {
    
    var view: WeatherListView?
    var interactor: WeatherListUseCase!
    var router: WeatherListWireframe!
    
    var weatherData = [WeatherListModel]()
    
    func viewDidLoad() {
        
    }
    
    func fetchWeatherData(_ cityIds: String) {
        
        view?.showActivityIndicator()
        interactor.fetchWeatherData(cityIds)
    }
}

extension WeatherListPresenter: WeatherListInteractorOutput {
    
    func weatherDataFetchedSuccessfully(_ weatherListModel: [WeatherListModel]) {
        self.weatherData = weatherListModel
        
        view?.hideActivityIndicator()
        view?.showWeather(self.weatherData)
    }
    
    func weatherDataFetchFailed() {
        view?.hideActivityIndicator()
        view?.showNoContentScreen()
    }
}
