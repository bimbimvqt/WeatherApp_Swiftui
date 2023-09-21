//
//  WeatherData2.swift
//  WeatherApp
//
//  Created by Tuấn Vương on 21/09/2023.
//

import Foundation
import Alamofire



class WeatherService {
    func fetchWeather(completion: @escaping (Weather) -> Void) {
        AF.request("https://api.weatherapi.com/v1/forecast.json?key=9b61510c2a3649fa80e73432232109&q=SanFrancisco&days=5").responseJSON { response in
            if let data = response.data {
                let decoder = JSONDecoder()
                if let weatherResponse = try? decoder.decode(Weather.self, from: data) {
                    completion(weatherResponse)
                }
            }
        }
    }
}
class WeatherViewModel: ObservableObject {
    @Published var weather: Weather?
    @Published var forecast: [Weather] = []

    let weatherService = WeatherService()

    func fetchWeather() {
        weatherService.fetchWeather { weather in
            DispatchQueue.main.async {
                self.weather = weather
                // Assume the first day is today, and the remaining days are the forecast.
                self.forecast = Array(weather.self)
            }
        }
    }
}
