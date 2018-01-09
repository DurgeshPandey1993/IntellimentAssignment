//
//  WeatherDetailContractor.swift
//  IntellimentAssignment
//
//  Created by Durgesh Pandey on 08/01/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import Foundation
import UIKit

protocol WeatherDetailView: IndicatableView {
    
    var presenter: WeatherDetailPresentation! { get set }
    
    func showWeatherDetail(_ weatherDetailModel: WeatherDetailModel)
    func showNoContentScreen()
}

protocol WeatherDetailPresentation: class {
    
    weak var view: WeatherDetailView? { get set }
    var interactor: WeatherDetailUseCase! { get set }
    var router: WeatherDetailWireframe! { get set }
    
    func viewDidLoad()
    func fetchWeatherDetailData(_ cityId: String)
}

protocol WeatherDetailUseCase: class {
    
    var output: WeatherDetailInteractorOutput! { get set }
    
    func fetchWeatherDetailData(_ cityId: String)
}

protocol WeatherDetailInteractorOutput: class {
    
    func weatherDetailDataFetchedSuccessfully(_ weatherDetailModel: WeatherDetailModel)
    func weatherDetailDataFetchFailed()
}

protocol WeatherDetailWireframe: class {
    
    weak var viewController: UIViewController? { get set }
    
    static func assembleModule(_ cityId: String, _ weatherListModel: WeatherListModel) -> UIViewController
}
