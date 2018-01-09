//
//  RootRouter.swift
//  IntellimentAssignment
//
//  Created by Durgesh Pandey on 08/01/18.
//  Copyright © 2018 Durgesh Pandey. All rights reserved.
//

import UIKit

class RootRouter: RootWireframe {
    
    func presentHomeScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = WeatherListRouter.assembleModule()
    }
}
