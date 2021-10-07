//
//  WeatherData.swift
//  WeatherApp_test
//
//  Created by Миша Москвичев on 07.10.2021.
//

import Foundation

struct WeatherData: Codable {
    let name : String
    let main : Main
    let weather : [Weather]
}

struct Main : Codable {
    let temp : Double
}

struct Weather : Codable{
    let id : Int
}
