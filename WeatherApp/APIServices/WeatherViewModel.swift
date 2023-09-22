//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Tuấn Vương on 22/09/2023.
//

import Foundation

private let defaultIcon = "logo"

private let iconMap = [
    "Drizzle" : "cloud",
    "ThunderStorm": "storm",
    "Rain": "rain",
    "Clear": "clear",
    "Snow": "snow",
    "Clouds": "cloud",
]

class WeatherViewModel: ObservableObject {
    
    @Published var cityName: String = "City Name"
    @Published var temperature: String = "--"
    @Published var weatherDescription: String = "--"
    @Published var weatherIcon: String = defaultIcon
    @Published var tempMin: Double = 0
    @Published var tempMax: Double = 0
    
    public let weatherService: WeatherService
    
    init(weatherService: WeatherService){
        self.weatherService = weatherService
    }
    
    func refresh(){
        weatherService.loadWeatherData{ weather in
            DispatchQueue.main.async {
                self.cityName = weather.city
                self.tempMin = weather.tempMin
                self.tempMax = weather.tempMax
                self.temperature = "\(weather.temperature)°C"
                self.weatherDescription = weather.description.capitalized
                self.weatherIcon = iconMap[weather.iconName] ?? defaultIcon
                
            }
            
        }
    }
    
}
