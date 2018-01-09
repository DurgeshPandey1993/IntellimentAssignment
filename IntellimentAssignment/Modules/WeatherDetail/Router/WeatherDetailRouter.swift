//
//  WeatherDetailRouter.swift
//  IntellimentAssignment
//
//  Created by Durgesh Pandey on 08/01/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import Foundation
import UIKit

class WeatherDetailRouter: WeatherDetailWireframe {
    
    var viewController: UIViewController?
    
    static func assembleModule(_ cityId: String, _ weatherListModel: WeatherListModel) -> UIViewController {
        
        let view: WeatherDetailViewController = weatherDetailBoard.instantiateViewController(withIdentifier: "WeatherDetailViewController") as! WeatherDetailViewController
        
        let interactor = WeatherDetailInteractor()
        let presenter = WeatherDetailPresenter()
        let router = WeatherDetailRouter()
        
        view.cityId = cityId
        view.weatherListModel = weatherListModel
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        router.viewController = view
        
        return view
    }
}
