//
//  CitiesDetailInteractor.swift
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

protocol CitiesDetailBusinessLogic {
    func fetchDetails() 
}

protocol CitiesDetailDataStore: class {
    var cityId: Int { get set }
}

class CitiesDetailInteractor: CitiesDetailDataStore {
    
    var cityId: Int = -1
  
}

extension CitiesDetailInteractor: CitiesDetailBusinessLogic {
    func fetchDetails() {
        print("cityId \(cityId)")
    }
}