//
//  Weather.swift
//  WeatherApp
//
//  Created by Tuấn Vương on 22/09/2023.
//

import Foundation

struct Weather {
    
    let city: String
    let temperature: String
    let tempMax: Double
    let tempMin: Double
    let description: String
    let iconName : String
    
    
    init(response: APIResponse){
        city = response.name
        temperature = "\(Int(response.main.temp))"
        tempMin = response.main.temp_min
        tempMax = response.main.temp_max
        description = response.weather.first?.description ?? ""
        iconName = response.weather.first?.iconName ?? ""
    }
    
}
