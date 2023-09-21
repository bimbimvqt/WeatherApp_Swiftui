//
//  WeatherAPI.swift
//  WeatherApp
//
//  Created by Tuấn Vương on 21/09/2023.
//

import SwiftUI
import CoreLocation

struct WeatherAPI: View {
    @State private var weatherData: WeatherData?

    func fetchWeatherData(for location: CLLocation) {
        
        let apiKey = "e401a55f23ecb21f8dca954a7b33969f"
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&units=metric&appid=\(apiKey)"
        
        guard let url = URL(string: urlString) else { return }
        
        // Make a network request to fetch weather data
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let weatherResponse = try decoder.decode(WeatherResponse.self, from: data)
                
                DispatchQueue.main.async {
                    // Update the weatherData state with fetched data
                    weatherData = WeatherData(cityName: weatherResponse.name, temperature: weatherResponse.main.temp, condition: weatherResponse.weather.first?.description ?? "")
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct WeatherAPI_Previews: PreviewProvider {
    static var previews: some View {
        WeatherAPI()
    }
}
