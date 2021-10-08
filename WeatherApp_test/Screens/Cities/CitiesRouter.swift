//
//  CitiesRouter.swift
//  WeatherApp_test
//
//  Created by Миша Москвичев on 06.10.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CitiesRoutingLogic {
    func navigateToDetail(cityId: Int)
}

protocol CitiesDataPassing {
    var dataStore: CitiesDataStore? { get }
}

class CitiesRouter: NSObject, CitiesDataPassing {
    
    weak var viewController: UIViewController?
    var dataStore: CitiesDataStore?
}

extension CitiesRouter: CitiesRoutingLogic {
    
    func navigateToDetail(cityId: Int) {
        let storyboard = UIStoryboard(name: "CitiesDetailViewController", bundle: nil)
        guard let citiesVC = storyboard.instantiateViewController(withIdentifier: "CitiesDetailViewController") as? CitiesDetailViewController else { return }
        
        citiesVC.router?.dataStore?.cityId = cityId
        viewController?.navigationController?.pushViewController(citiesVC, animated: true)
    }
    
}
