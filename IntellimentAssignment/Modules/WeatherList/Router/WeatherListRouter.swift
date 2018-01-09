//
//  WeatherListRouter.swift
//  IntellimentAssignment
//
//  Created by Durgesh Pandey on 08/01/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import Foundation
import UIKit

class WeatherListRouter: WeatherListWireframe {
    
    var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        
        let view: WeatherListViewController = weatherListBoard.instantiateViewController(withIdentifier: "WeatherListViewController") as! WeatherListViewController
        
        let interactor = WeatherListInteractor()
        let presenter = WeatherListPresenter()
        let router = WeatherListRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        router.viewController = view
        
        return UINavigationController.init(rootViewController: view)
    }
    
    func navigateToDetailScreen(_ weatherListModel: WeatherListModel) {
        
        //Navigate To Detail
        if let cityIdSelected = weatherListModel.id {
            
            let cityIdStr = String.init(format: "%.f", cityIdSelected)
            let weatherDetailController: WeatherDetailViewController = WeatherDetailRouter.assembleModule(cityIdStr, weatherListModel) as! WeatherDetailViewController
            viewController?.navigationController?.pushViewController(weatherDetailController, animated: true)
        }
    }
}
