//
//  DailyForecastData.swift
//  WeatherApp
//
//  Created by Tuấn Vương on 21/09/2023.
//

import Foundation

struct DailyForecast: Codable {
    let date: Date
    let temperature: Double
    
    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case temperature = "temp"
    }
}
