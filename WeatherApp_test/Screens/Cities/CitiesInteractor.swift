//
//  CitiesInteractor.swift
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

protocol CitiesBusinessLogic {
    func fetchCities()
}

protocol CitiesDataStore
{
    
}

class CitiesInteractor {
    
    //MARK: - External vars
    var presenter: CitiesPresentationLogic?
}

//MARK: - Business logic

extension CitiesInteractor: CitiesBusinessLogic {
    func fetchCities() {
        var backendResponse = [WeatherBackendModel]()
        let model = WeatherBackendModel(cityId: "0", name: "London", text: "20", rating: 5, symbolCount: 100)
        
        backendResponse.append(model)
        backendResponse.append(model)
        backendResponse.append(model)
        backendResponse.append(model)
        backendResponse.append(model)
        
        
        presenter?.present(data: backendResponse)
    }
    
    
}

