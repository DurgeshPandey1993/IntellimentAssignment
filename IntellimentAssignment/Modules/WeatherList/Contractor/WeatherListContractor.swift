//
//  WeatherListContractor.swift
//  IntellimentAssignment
//
//  Created by Durgesh Pandey on 08/01/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import Foundation
import UIKit

protocol WeatherListView: IndicatableView {
    
    var presenter: WeatherListPresentation! { get set }
    
    func showWeather(_ weatherListModel: [WeatherListModel])
    func showNoContentScreen()
}

protocol WeatherListPresentation: class {
    
    weak var view: WeatherListView? { get set }
    var interactor: WeatherListUseCase! { get set }
    var router: WeatherListWireframe! { get set }
    
    func viewDidLoad()
    func fetchWeatherData(_ cityIds: String)
}

protocol WeatherListUseCase: class {
    
    var output: WeatherListInteractorOutput! { get set }
    
    func fetchWeatherData(_ cityIds: String)
}

protocol WeatherListInteractorOutput: class {
    
    func weatherDataFetchedSuccessfully(_ weatherListModel: [WeatherListModel])
    func weatherDataFetchFailed()
}

protocol WeatherListWireframe: class {
    
    weak var viewController: UIViewController? { get set }
    
    static func assembleModule() -> UIViewController
    func navigateToDetailScreen(_ weatherListModel: WeatherListModel)
}
